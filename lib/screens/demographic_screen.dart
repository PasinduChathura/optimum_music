import 'package:flutter/material.dart';
import 'package:optimum_music/utils/models.dart';

class DemographicScreen extends StatelessWidget {
  const DemographicScreen({Key? key, required this.demographic})
      : super(key: key);

  final Demographic demographic;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // appBar: PreferredSize(
      //     preferredSize: Size(_size.width, _size.height * 0.1),
      //     child: const Center(child: AppBarWidget())),
      body: Container(
        // padding: EdgeInsets.symmetric(horizontal: _size.width * 0.0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Identified Age',
                          style: _textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: _size.width * 0.035),
                        ),
                        Text(
                          demographic.age,
                          style: _textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: _size.width * 0.035),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.white,
                      height: 30,
                      width: 1,
                    ),
                    Column(
                      children: [
                        Text(
                          'Identified Gender',
                          style: _textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: _size.width * 0.035),
                        ),
                        Text(
                          demographic.gender,
                          style: _textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: _size.width * 0.035),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.white,
                      height: 30,
                      width: 1,
                    ),
                    Column(
                      children: [
                        Text(
                          'Identified Ethnicity',
                          style: _textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: _size.width * 0.035),
                        ),
                        Text(
                          demographic.ethnicity,
                          style: _textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: _size.width * 0.035),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: _size.height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
                  child: Column(
                    children: [
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
                          for (int i = 0;
                              i < demographic.recommendations!.length;
                              i++)
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
                                  Text(demographic.recommendations![i])
                                ],
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
