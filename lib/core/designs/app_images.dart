import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImages extends StatelessWidget {
  final String path;
  final double? height, width;
  final BoxFit fit;
  final Color? color;

  const AppImages(this.path,
      {Key? key,
      this.height,
      this.width,
      this.fit = BoxFit.scaleDown,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (path.contains("com.example.audioandvideo/cache")) {
      return Image.file(
        File(path),
        color: color,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _errorWidget(),
      );
    } else if (path.endsWith("svg")) {
      return SvgPicture.asset(
        "assets/svg/$path",
        height: height,
        width: width,
        fit: fit,
        colorFilter: color != null
            ? ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              )
            : null,
      );
    } else if (path.startsWith("http")) {
      return Image.network(
        path,
        height: height,
        width: width,
        fit: fit,
        color: color,
        errorBuilder: (context, error, stackTrace) => _errorWidget(),
      );
    } else if (path.endsWith("png") || path.endsWith("jpg")) {
      return Image.asset(
        "assets/images/$path",
        height: height,
        width: width,
        fit: fit,
        color: color,
        errorBuilder: (context, error, stackTrace) => _errorWidget(),
      );
    }
    return _errorWidget();
  }

  Widget _errorWidget() {
    return AppImages(
      "image_failed.png",
      height: height,
      width: width,
    );
  }
}
