import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  // Variables
  final String svgFile;
  final double? width;
  final double? height;
  final Color? color;

   const SvgIcon(this.svgFile, {this.width, this.height, this.color});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/svg/$svgFile',
        width: width ?? 50, height: height ?? 80, color: color ?? Colors.white);
  }
}
