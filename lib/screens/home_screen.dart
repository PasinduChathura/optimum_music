import 'package:flutter/material.dart';
import 'package:optimum_music/screens/image_resoponse_screen.dart';
import 'package:optimum_music/widgets/app_logo.dart';
import 'package:optimum_music/widgets/btn.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(
              height: 100,
            ),
            SizedBox(
              height: _size.height * 0.05,
            ),
            CustomButton(
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return const ImageResponseScreen();
                }));
              },
              title: 'Add Image',
              icon: Icons.image,
              index: 1,
            ),
            SizedBox(
              height: _size.height * 0.01,
            ),
            CustomButton(
              onTap: () {
                // Navigator.of(context)
                //     .pushReplacement(MaterialPageRoute(builder: (context) {
                //   return const HomeScreen();
                // }));
              },
              index: 2,
              title: 'Add Video',
              icon: Icons.video_library_outlined,
            )
          ],
        ),
      ),
    );
  }
}
