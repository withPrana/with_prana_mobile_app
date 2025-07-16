import 'package:flutter/material.dart';

class GradientImageWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? fit;
  final LinearGradient gradient;
  final ImageProvider image;
  final double? opacity;
  const GradientImageWidget({
    super.key,
    this.width,
    this.height,
    this.fit,
    this.opacity,
    required this.gradient,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(bounds);
      },
      child: Image(
        color: Colors.white,
        image: image,
        width: width,
        height: height,
        fit: fit,
        opacity: AlwaysStoppedAnimation(opacity ?? 1),
      ),
    );
  }
}
