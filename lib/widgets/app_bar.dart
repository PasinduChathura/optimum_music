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
      // height: _size.height * 0.5,
      color: HexColor('0a1227'),
      child: Padding(
        padding:  EdgeInsets.only(top: _size.height * 0.06),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SvgIcon(
                  'menu_icon.svg',
                  height: 10,
                ),
              ),
              AppLogo(
                height: _size.height * 0.09,
              ),
              Icon(
                Icons.search,
                color: Colors.white,
                size: _size.width * 0.07,
              )
            ],
          ),
        ),
      ),
    );
  }
}
