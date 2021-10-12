import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:optimum_music/widgets/app_logo.dart';

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios)),
              AppLogo(
                height: _size.height * 0.09,
              ),
              SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
