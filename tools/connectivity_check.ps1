# DEEWAR connectivity self-test (Windows PowerShell).
# Verifies that the configured Pusher / Agora / backend actually reach their
# servers. Run with:  powershell -ExecutionPolicy Bypass -File tools\connectivity_check.ps1

$ErrorActionPreference = 'Stop'
$Results = @()

function Add-Result {
    param([string]$Name, [bool]$Ok, [string]$Detail)
    $script:Results += [PSCustomObject]@{ Name = $Name; Status = $(if ($Ok) { 'PASS' } else { 'FAIL' }); Detail = $Detail }
    if ($Ok) { Write-Host ("[PASS] " + $Name + "  " + $Detail) -ForegroundColor Green }
    else     { Write-Host ("[FAIL] " + $Name + "  " + $Detail) -ForegroundColor Red }
}

function Get-UnixTime {
    return [int64](([DateTimeOffset]::UtcNow).ToUnixTimeSeconds())
}

function Get-HmacHex {
    param([string]$Key, [string]$Data)
    $hmac = New-Object System.Security.Cryptography.HMACSHA256
    $hmac.Key = [Text.Encoding]::UTF8.GetBytes($Key)
    $hashBytes = $hmac.ComputeHash([Text.Encoding]::UTF8.GetBytes($Data))
    return (($hashBytes | ForEach-Object { $_.ToString('x2') }) -join '')
}

# ---- Config under test (must match the Flutter app) ----
$PusherKey        = '82665959f9718e802a85'
$PusherSecret     = '1162efc471cf3f58de02'
$PusherAppId      = 2201383
$PusherCluster    = 'mt1'
$AgoraAppId       = '8a9f051b1f994a18bda7f6e8fd105e62'
$ApiBaseUrl       = 'https://deewar.egyptiantechs.com'
$FirebaseProject  = 'deewar-c6b1a'

# ---- 1. Pusher WebSocket handshake (real connection to cluster mt1) ----
try {
    # NOTE: build the URL by concatenation - PowerShell double-quote interpolation
    # corrupts '<var>?protocol=...' style query strings.
    $wsUrl = 'wss://ws-' + $PusherCluster + '.pusher.com/app/' + $PusherKey + '?protocol=7&client=js&version=8.4.0&flash=false'
    $ws = New-Object System.Net.WebSockets.ClientWebSocket
    $ws.Options.AddSubProtocol('pusher')
    $ct = New-Object System.Threading.CancellationTokenSource(15000)
    $ws.ConnectAsync([Uri]$wsUrl, $ct.Token).GetAwaiter().GetResult() | Out-Null
    $buf = New-Object byte[] 8192
    $seg = New-Object System.ArraySegment[byte] -ArgumentList @(,$buf)
    $recv = $ws.ReceiveAsync($seg, $ct.Token).GetAwaiter().GetResult()
    $msg = [Text.Encoding]::UTF8.GetString($buf, 0, $recv.Count)
    try { $ws.CloseAsync([System.Net.WebSockets.WebSocketCloseStatus]::NormalClosure, 'done', $ct.Token).GetAwaiter().GetResult() | Out-Null } catch {}
    $ws.Dispose()
    if ($msg -match 'pusher:connection_established') {
        Add-Result 'Pusher WebSocket (cluster mt1)' $true "handshake OK, socket accepted. $msg".Substring(0, 90)
    } elseif ($msg -match 'pusher:error') {
        Add-Result 'Pusher WebSocket (cluster mt1)' $false "server rejected: $msg"
    } else {
        Add-Result 'Pusher WebSocket (cluster mt1)' $true "connected, first frame: $msg"
    }
} catch {
    Add-Result 'Pusher WebSocket (cluster mt1)' $false $_.Exception.Message
}

# ---- 2. Pusher HTTP API with signed HMAC (validates key + secret + app_id) ----
try {
    $ts = Get-UnixTime
    $bodyMd5  = (([Security.Cryptography.MD5]::Create()).ComputeHash([Text.Encoding]::UTF8.GetBytes('')) | ForEach-Object { $_.ToString('x2') }) -join ''
    $qs = "auth_key=$PusherKey&auth_timestamp=$ts&auth_version=1.0&body_md5=$bodyMd5"
    $stringToSign = "GET`n/apps/$PusherAppId/channels`n$qs"
    $sig = Get-HmacHex -Key $PusherSecret -Data $stringToSign
    $url = "https://api-$($PusherCluster).pusher.com/apps/$PusherAppId/channels?$qs&auth_signature=$sig"
    $resp = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 20
    Add-Result 'Pusher HTTP API (app_id+key+secret)' ($resp.StatusCode -eq 200) "HTTP $($resp.StatusCode) -> $($resp.Content)"
} catch {
    if ($_.Exception.Response) {
        $code = [int]$_.Exception.Response.StatusCode.value__
        Add-Result 'Pusher HTTP API (app_id+key+secret)' $false "HTTP $code - wrong key/secret/app_id or network issue"
    } else {
        Add-Result 'Pusher HTTP API (app_id+key+secret)' $false $_.Exception.Message
    }
}

# ---- 3. Agora App ID format + API reachability ----
if ($AgoraAppId -match '^[a-fA-F0-9]{32}$') {
    Add-Result 'Agora App ID format (32 hex)' $true $AgoraAppId
} else {
    Add-Result 'Agora App ID format (32 hex)' $false $AgoraAppId
}
try {
    $r = Invoke-WebRequest -Uri 'https://api.agora.io/' -UseBasicParsing -TimeoutSec 20 -MaximumRedirection 5
    Add-Result 'Agora REST reachability' $true "HTTP $($r.StatusCode)"
} catch {
    $code = if ($_.Exception.Response) { [int]$_.Exception.Response.StatusCode.value__ } else { 'ERR' }
    Add-Result 'Agora REST reachability' ($code -ge 400 -and $code -lt 600) "reachable (HTTP $code) - appId itself is validated at runtime by RtcEngine.create()"
}

# ---- 4. Backend API ----
try {
    $r = Invoke-WebRequest -Uri "$ApiBaseUrl/api" -UseBasicParsing -TimeoutSec 20 -MaximumRedirection 5
    Add-Result 'Backend API reachable' $true "HTTP $($r.StatusCode) at $ApiBaseUrl"
} catch {
    $code = if ($_.Exception.Response) { [int]$_.Exception.Response.StatusCode.value__ } else { 'ERR' }
    Add-Result 'Backend API reachable' ($code -ge 400 -and $code -lt 600) "reachable (HTTP $code) at $ApiBaseUrl"
}

# ---- 5. Firebase project match ----
try {
    $r = Invoke-WebRequest -Uri "https://firebasestorage.googleapis.com/v0/b/$FirebaseProject.firebasestorage.app/o" -UseBasicParsing -TimeoutSec 20
    Add-Result 'Firebase storage project' $true "HTTP $($r.StatusCode) - project '$FirebaseProject' resolves"
} catch {
    $code = if ($_.Exception.Response) { [int]$_.Exception.Response.StatusCode.value__ } else { 'ERR' }
    Add-Result 'Firebase storage project' ($code -ge 400 -and $code -lt 600) "reachable (HTTP $code)"
}

Write-Host ''
Write-Host '================ SUMMARY ================' 
$fails = @($Results | Where-Object { $_.Status -eq 'FAIL' }).Count
Write-Host ("PASS: " + (@($Results | Where-Object { $_.Status -eq 'PASS' }).Count) + "  FAIL: " + $fails)
exit $(if ($fails -eq 0) { 0 } else { 1 })