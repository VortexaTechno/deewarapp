# DEEWAR (ديوار) — Flutter source

Rebranded version of the (build-fixed) Koki Chat project with a new identity.

- App name: **ديوار** (brand: **DEEWAR**)
- Android package / applicationId: `com.deewar.app`
- API base URL: `https://deewar.egyptiantechs.com/api`
- Font: Tajawal (bundled in `assets/fonts/`, applied app-wide)
- Theme color: **blue `0xFF2060C0`** (matches the launcher icon; different from
  the Onsora purple so the app is visibly its own product)
- Launcher icons: Android adaptive icon set included in `res/mipmap-*`

## Required toolchain (already validated)

| Tool       | Version                                   |
|------------|-------------------------------------------|
| Flutter    | 3.47.6 stable (`flutter --version` line 1)|
| Dart       | 3.13.5                                    |
| JDK        | Temurin 17 (17.0.20.1+1 tested)           |
| Gradle     | 8.14 (via `android/gradle/wrapper`)       |
| AGP        | 8.11.1                                    |
| Kotlin     | 2.2.20                                    |
| NDK        | 28.2.13676358 (used by agora)             |
| CMake      | 3.22.1                                    |
| compileSdk | 36 / build-tools 36.0.0                   |

## Build

```bash
flutter pub get
flutter build apk --release            # installable APK
flutter build appbundle --release      # Play Store AAB
```

## Firebase (already configured)

`android/app/google-services.json` is the real DEEWAR project config:

- project: `deewar-c6b1a` — project number `194679928375`
- package: `com.deewar.app`
- mobilesdk_app_id: `1:194679928375:android:fc0db1a2b71d0a19e031b2`
- api key: `AIzaSyC7nnanlWEY7jZa7l5dWlfvS8zAGAzukYE`

No Firebase console changes needed — this file matches the app, so
Google Sign-In / Phone auth / FCM work out of the box.

## Pusher

- app_id: `2201383`
- key: `82665959f9718e802a85`
- secret: `1162efc471cf3f58de02` (server-side only; NOT used by the app)
- cluster: `mt1`

The client only needs the key + cluster (already set in `PusherInit()`
in `lib/core/utils/helper.dart`). The secret is for your backend when you
authenticate private channels or push events.

## Agora

- APP_ID: `8a9f051b1f994a18bda7f6e8fd105e62`
- Primary Certificate: `28ff849758c9459ca3ffb7fd484c3de9` (server-side only —
  used to mint tokens; the app itself only embeds the APP_ID)
- Agora web wrapper is patched (`third_party/agora_rtc_engine/lib/agora_rtc_engine_web.dart`)
  to use `await` + `dartify` instead of the old `promiseToFuture` pattern.

## Signing — INCLUDED, ready to upload

The release keystore and credentials are ALREADY in this source:

- `android/app/banince-release.jks` (RSA 2048, alias `banince`)
- `android/key.properties` (relative `storeFile` -> works on any machine after
  extracting the zip)

`flutter build appbundle --release` is signed with this key and the AAB is
directly uploadable to Google Play. `flutter build apk --release` gives the
installable APK with the same signature.

> Keep this keystore and its password private — it is the app's identity.
> Losing it means the app can never be updated on Play.

## Play Store listing assets

- `assets/play_store/play_store_512.png` — 512x512 store icon
- `assets/play_store/1024.png` — square app icon

Upload these in Play Console together with the AAB.

## Already-applied build fixes (do not revert)

- `flutter_sim_country_code` vendored into `third_party/` and pinned via
  `dependency_overrides`; its old `PluginRegistry.Registrar` API was removed.
  Local path plugins: `agora_rtc_engine`, `svgaplayer_flutter`, `share`,
  `simple_timer` (see `pubspec.yaml`).
- `gradle.projectsEvaluated` forces Java/Kotlin 17 in `android/build.gradle`.
- Java 17 + `coreLibraryDesugaringEnabled` (desugar_jdk_libs 2.1.5).
- `uses-material-design: true` in the pubspec.
- ProGuard: `-dontwarn org.slf4j.**` (+ binders), FlutterActivity keep rule,
  Agora/Firebase/Facebook keeps.
- Agora web `dartify` patch (see Agora section above).

## Config locations (change with care)

- API host: `lib/core/network/api_constance.dart` and `lib/core/utils/app_constance.dart`
  (or override at build time: `--dart-define=API_BASE_URL=...` / `--dart-define=SERVER_URL=...`).
- Agora App ID: `lib/core/utils/app_constance.dart` (`APP_ID`).
- Pusher key/cluster: `PusherInit()` in `lib/core/utils/helper.dart`
  (key `82665959f9718e802a85`, cluster `mt1`).
- Theme/colors: `lib/core/utils/styles.dart` (`MainColor`) and `lib/main.dart`.