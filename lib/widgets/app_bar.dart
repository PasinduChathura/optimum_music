import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:optimum_music/widgets/app_logo.dart';
import 'package:optimum_music/widgets/svg_icon.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      color: HexColor('0a1227'),
      child: Padding(
        padding: EdgeInsets.only(top: _size.height * 0.06),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
          child: AppLogo(
            height: _size.height * 0.09,
          ),
        ),
      ),
    );
  }
}
