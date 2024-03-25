import 'package:finfriends/view/home/main/HeaderLayout.dart';
import 'package:finfriends/view/home/navigation/NavigationLayout.dart';
import 'package:finfriends/view/findFinf/FindFinfMain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;

  void _updateIndex(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final String plusIconPath = _currentIndex == 2
        ? 'assets/svg_icons/plusIcon_on.svg'
        : 'assets/svg_icons/plusIcon_off.svg';

    return Scaffold(
      appBar: const HeaderLayout(),
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: const [
              SingleChildScrollView(child: FindFinfMain()),
              Center(child: Text("Page 1")),
              Center(child: Text("Page 2")),
              Center(child: Text("Page 3")),
              Center(child: Text("Page 4")),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/svg_icons/navigationBar.svg',
              fit: BoxFit.cover,
              height: 60,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: NavigationLayout(
              currentIndex: _currentIndex,
              onPageChanged: _updateIndex,
            ),
          ),
          Positioned(
            bottom: 36,
            left: screenWidth / 2 - 24,
            child: GestureDetector(
              onTap: () {
                _updateIndex(2);
              },
              child: SvgPicture.asset(
                plusIconPath,
                // width: 60,
                // height: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
