import 'package:flutter/material.dart';
import 'package:optimum_music/utils/models.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key, required this.activity}) : super(key: key);

  final Activity activity;

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
                const Text('Identified Activity'),
                Text(
                  activity.activity,
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
                    for (int i = 0; i < activity.recommendations.length; i++)
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
                            Text(activity.recommendations[i])
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
