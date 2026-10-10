# Flutter / Dart
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-dontwarn io.flutter.embedding.**

# The Android embedding / FlutterActivity & plugins are resolved reflectively
-keep class com.deewar.app.MainActivity { *; }

# Agora RTC (native callbacks, JNI)
-keep class io.agora.** { *; }
-dontwarn io.agora.**

# Firebase
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**
-keep class io.flutter.plugins.firebase.** { *; }

# Facebook SDK
-keep class com.facebook.** { *; }
-dontwarn com.facebook.**
-keep class com.facebook.react.** { *; }

# Google Sign-In
-keep class com.google.android.gms.auth.** { *; }
-keep class com.google.android.gms.common.** { *; }

# Pusher
-keep class com.pusher.** { *; }
-dontwarn com.pusher.**
-keep class com.pusher.pushnotifications.** { *; }

# Billing / in-app purchases
-keep class com.android.billingclient.** { *; }
-dontwarn com.android.billingclient.**

# Lifecycle / permissions / image handling
-keep class androidx.lifecycle.** { *; }
-dontwarn androidx.lifecycle.**
-keep class io.flutter.plugins.imagepicker.** { *; }
-keep class io.flutter.plugins.securestorage.** { *; }
-keep class io.flutter.plugins.sharedpreferences.** { *; }
-keep class io.flutter.plugins.androidembedding.** { *; }

# Kotlin metadata used by reflection-heavy plugins
-keepattributes *Annotation*, Signature, InnerClasses, EnclosingMethod

# slf4j is present only as an API; no binding (StaticLoggerBinder) is shipped,
# so it falls back to the no-op logger at runtime. R8 treats the missing binding
# as a hard error unless told otherwise. AGP generated this rule itself into
# build/app/outputs/mapping/release/missing_rules.txt
-dontwarn org.slf4j.**
-dontwarn org.slf4j.impl.StaticLoggerBinder

# Silence warnings for optional/unsupported references pulled in by SDKs
-dontwarn javax.annotation.**
-dontwarn org.conscrypt.**
-dontwarn org.bouncycastle.**
-dontwarn org.openjsse.**
-dontwarn kotlin.Unit
-dontwarn kotlin.coroutines.**

# Optional compile-only annotations that ship inside other AARs
-dontwarn com.google.errorprone.annotations.**
-dontwarn org.codehaus.mojo.animal_sniffer.**
-dontwarn javax.annotation.**
-dontwarn org.checkerframework.**