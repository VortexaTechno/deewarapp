import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Static config verification for the DEEWAR brand.
/// Run: flutter test test/deewar_config_test.dart
void main() {
  final root = Directory.current.path;

  String read(String rel) => File('$root/$rel').readAsStringSync();

  group('DEEWAR branding / package', () {
    test('gradle: namespace + applicationId = com.deewar.app', () {
      final g = read('android/app/build.gradle');
      expect(g, contains('namespace "com.deewar.app"'));
      expect(g, contains('applicationId "com.deewar.app"'));
    });

    test('AndroidManifest label = ديوار', () {
      final m = read('android/app/src/main/AndroidManifest.xml');
      expect(m, contains('android:label="ديوار"'));
    });

    test('debug/profile manifests use com.deewar.app', () {
      expect(read('android/app/src/debug/AndroidManifest.xml'), contains('com.deewar.app'));
      expect(read('android/app/src/profile/AndroidManifest.xml'), contains('com.deewar.app'));
    });

    test('MainActivity declares com.deewar.app', () {
      final k = read('android/app/src/main/kotlin/com/deewar/app/MainActivity.kt');
      expect(k, contains('package com.deewar.app'));
      expect(k, contains('FlutterActivity'));
    });

    test('strings.xml app_name = ديوار', () {
      expect(read('android/app/src/main/res/values/strings.xml'), contains('>ديوار<'));
    });

    test('language assets APP_NAME = ديوار / DEEWAR', () {
      expect(jsonDecode(read('assets/language/ar.json'))['APP_NAME'], 'ديوار');
      expect(jsonDecode(read('assets/language/en.json'))['APP_NAME'], 'DEEWAR');
    });
  });

  group('Firebase', () {
    test('google-services.json matches com.deewar.app / deewar-c6b1a', () {
      final j = jsonDecode(read('android/app/google-services.json'));
      expect(j['project_info']['project_id'], 'deewar-c6b1a');
      final client = (j['client'] as List).first as Map<String, dynamic>;
      expect(client['client_info']['android_client_info']['package_name'], 'com.deewar.app');
      expect(client['client_info']['mobilesdk_app_id'], '1:194679928375:android:fc0db1a2b71d0a19e031b2');
    });
  });

  group('Pusher', () {
    test('helper.dart uses the DEEWAR apiKey + cluster', () {
      final h = read('lib/core/utils/helper.dart');
      expect(h, contains('82665959f9718e802a85'));
      expect(h, contains('"mt1"'));
    });
  });

  group('Agora', () {
    test('APP_ID is the DEEWAR Agora App ID (32 hex)', () {
      final a = read('lib/core/utils/app_constance.dart');
      expect(a, contains("'8a9f051b1f994a18bda7f6e8fd105e62'"));
    });

    test('agora web wrapper uses await + dartify (user fix)', () {
      final w = read('third_party/agora_rtc_engine/lib/agora_rtc_engine_web.dart');
      expect(w, isNot(contains('promiseToFuture')));
      expect(w, contains('dartify'));
    });
  });

  group('Backend domain', () {
    test('app_constance / api_constance point at deewar.egyptiantechs.com', () {
      expect(read('lib/core/utils/app_constance.dart'), contains('deewar.egyptiantechs.com'));
      expect(read('lib/core/network/api_constance.dart'), contains('deewar.egyptiantechs.com'));
    });
  });

  group('Look & identity changed (not a copy of Onsora)', () {
    test('MainColor is the DEEWAR blue, not the Onsora purple', () {
      final s = read('lib/core/utils/styles.dart');
      expect(s, contains('0xFF2060C0'));
      expect(s, isNot(contains('0xFFb07efd')));
    });
  });

  group('Signing included', () {
    test('keystore + key.properties exist (so release is uploadable)', () {
      expect(File('$root/android/app/banince-release.jks').existsSync(), isTrue);
      expect(File('$root/android/key.properties').existsSync(), isTrue);
    });
  });

  group('Fonts & icons', () {
    test('Tajawal fonts wired in pubspec + present on disk', () {
      final p = read('pubspec.yaml');
      expect(p, contains('assets/fonts/Tajawal-Regular.ttf'));
      expect(p, contains('family: Tajawal'));
      expect(File('$root/assets/fonts/Tajawal-Regular.ttf').existsSync(), isTrue);
      expect(File('$root/assets/fonts/Tajawal-Bold.ttf').existsSync(), isTrue);
    });

    test('adaptive launcher icons present', () {
      expect(File('$root/android/app/src/main/res/mipmap-anydpi-v26/ic_launcher.xml').existsSync(), isTrue);
      expect(File('$root/android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png').existsSync(), isTrue);
      expect(File('$root/android/app/src/main/res/mipmap-xxxhdpi/ic_launcher_adaptive_fore.png').existsSync(), isTrue);
    });

    test('play store assets present', () {
      expect(File('$root/assets/play_store/1024.png').existsSync(), isTrue);
      expect(File('$root/assets/play_store/play_store_512.png').existsSync(), isTrue);
    });
  });
}