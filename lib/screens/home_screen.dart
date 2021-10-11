import 'package:flutter/material.dart';
import 'package:optimum_music/widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late PageController _tabController;

  int _selectedIndex = 0;
  @override
  void initState() {
    _tabController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(_size.width, _size.height * 0.1),
          child: const Center(child: AppBarWidget())),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Expanded(
              child: PageView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  // first tab bar view widget
                  Center(
                    child: Text(
                      'Place Bid',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // second tab bar view widget
                  Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
