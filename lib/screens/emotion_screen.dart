import 'package:flutter/material.dart';
import 'package:optimum_music/utils/models.dart';

class EmotionScreen extends StatelessWidget {
  const EmotionScreen({Key? key, required this.emotion}) : super(key: key);

  final Emotion emotion;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
        alignment: Alignment.center,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: _size.height * 0.04,
                ),
                const Text('Identified Current Mood'),
                Text(
                  emotion.emotion,
                  style: _textTheme.headline2!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: _size.height * 0.05,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Recommended Songs',
                    )),
                SizedBox(
                  height: _size.height * 0.025,
                ),
                Column(
                  children: [
                    for (int i = 0; i < emotion.recommendations.length; i++)
                      Container(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/album-placeholder.png',
                              width: _size.height * 0.085,
                              height: _size.height * 0.085,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Flexible(child: Text(emotion.recommendations[i]))
                          ],
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
