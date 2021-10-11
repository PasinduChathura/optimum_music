import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:optimum_music/screens/emotion_screen.dart';
import 'package:optimum_music/widgets/app_bar.dart';
import 'package:optimum_music/widgets/image_response_loading_widget.dart';
import 'package:shimmer/shimmer.dart';

enum LoadingState { Loading, NotLoading }

class ImageResponseScreen extends StatefulWidget {
  const ImageResponseScreen({Key? key, required this.imageFile})
      : super(key: key);
  final XFile? imageFile;

  @override
  State<ImageResponseScreen> createState() => _ImageResponseScreenState();
}

class _ImageResponseScreenState extends State<ImageResponseScreen>
    with SingleTickerProviderStateMixin {
  late PageController _tabController;
  LoadingState _lodingState = LoadingState.Loading;

  int _selectedIndex = 0;
  @override
  void initState() {
    _init();
    _tabController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  void _init() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _lodingState = LoadingState.NotLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(_size.width, _size.height * 0.1),
          child: const Center(child: AppBarWidget())),
      body: _lodingState == LoadingState.Loading
          ? const ImageResponseLoadingWidget()
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: _size.height * 0.02,
                  ),
                  Text(
                    'Playlist',
                    style: _textTheme.headline1
                        ?.copyWith(fontSize: _size.height * 0.034),
                  ),
                  SizedBox(height: _size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () {
                              _selectedIndex = 0;
                              setState(() {});
                              _tabController.animateToPage(_selectedIndex,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Emotion\nBased',
                                style: _textTheme.bodyText2?.copyWith(
                                    color: _selectedIndex == 0
                                        ? Colors.white
                                        : Colors.grey,
                                    decoration: _selectedIndex == 0
                                        ? TextDecoration.underline
                                        : null),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () {
                              _selectedIndex = 1;
                              setState(() {});
                              _tabController.animateToPage(_selectedIndex,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Demographic\nBased',
                                style: _textTheme.bodyText2?.copyWith(
                                    color: _selectedIndex == 1
                                        ? Colors.white
                                        : Colors.grey,
                                    decoration: _selectedIndex == 1
                                        ? TextDecoration.underline
                                        : null),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  Expanded(
                    child: PageView(
                      controller: _tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        // first tab bar view widget
                        EmotionScreen(),
                        EmotionScreen(),

                        // second tab bar view widget
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
