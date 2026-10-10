library svgaplayer_flutter;

import 'package:flutter/widgets.dart';

/// Compatibility widget for legacy SVGA assets. The former package is not
/// Dart 3 compatible; unavailable SVGA animations now degrade safely instead
/// of preventing the app from starting.
class SVGASimpleImage extends StatelessWidget {
  const SVGASimpleImage({super.key, this.resUrl, this.assetsName});

  final String? resUrl;
  final String? assetsName;

  @override
  Widget build(BuildContext context) => const SizedBox.expand();
}

class SVGAImage extends StatelessWidget {
  const SVGAImage(this.controller, {super.key, this.clearsAfterStop = true});

  final SVGAAnimationController controller;
  final bool clearsAfterStop;

  @override
  Widget build(BuildContext context) => const SizedBox.expand();
}

class SVGAAnimationController extends AnimationController {
  SVGAAnimationController({required TickerProvider vsync})
      : super(vsync: vsync, duration: const Duration(milliseconds: 1));

  Object? videoItem;

  void clear() => reset();
}

class SVGAParser {
  SVGAParser._();

  static final shared = SVGAParser._();

  Future<Object?> decodeFromURL(String _) async => null;
  Future<Object?> decodeFromAssets(String _) async => null;
}
