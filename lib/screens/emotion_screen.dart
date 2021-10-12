import 'package:flutter/material.dart';
import 'package:optimum_music/utils/models.dart';

class EmotionScreen extends StatelessWidget {

  final Emotion? emotion;
  const EmotionScreen({Key? key, this.emotion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // appBar: PreferredSize(
      //     preferredSize: Size(_size.width, _size.height * 0.1),
      //     child: const Center(child: AppBarWidget())),
      body: Container(
        //  padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
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
                  emotion!.emotion,
                  style: _textTheme.headline2!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: _size.height * 0.05,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Re-Identify'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[400])),
                ),
                SizedBox(
                  height: _size.height * 0.025,
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
                    for (int i = 0; i < emotion!.recommendations.length; i++)
                      Container(
                        padding: const EdgeInsets.only(bottom: 15),
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(emotion!.recommendations[i]),
                                Text(
                                  "HYONNA",
                                  style: _textTheme.bodyText1!.copyWith(
                                      fontSize: 10, color: Colors.blueGrey),
                                ),
                              ],
                            )
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
