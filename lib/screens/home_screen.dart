import 'package:flutter/material.dart';
import 'package:optimum_music/utils/api_respons_model.dart';
import 'package:optimum_music/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(_size.width, _size.height * 0.1),
          child: const Center(child: AppBarWidget())),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text('Identified Current Mood'),
            Text(
              'Happy',
              style:
                  _textTheme.headline2!.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: _size.height * 0.05,
            ),
            ElevatedButton(
              onPressed: () {
                APICall().aPICall().then((value) {
                  print(value.recommendations);
                });
              },
              child: Text('Re-Identify'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[400])),
            ),
            SizedBox(
              height: _size.height * 0.025,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Recommended Songs',
                )),
            SizedBox(
              height: _size.height * 0.025,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/chaff.jpg',
                            width: _size.height * 0.085,
                            height: _size.height * 0.085,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Chaff & Dust'),
                              Text(
                                "HYONNA",
                                style: _textTheme.bodyText1!.copyWith(
                                    fontSize: 10, color: Colors.blueGrey),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
