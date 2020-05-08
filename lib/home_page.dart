import 'package:flutter/material.dart';
import 'package:bpmcounter/bpm_page.dart';
import 'package:bpmcounter/metronome_page.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:bpmcounter/constants.dart';
import 'package:bpmcounter/metronome_brain.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _pages = [BPMPage(), MetronomePage()];
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tap Bpm & Metronome',
          style: TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: PageView(
        children: _pages,
        controller: _pageController,
        onPageChanged: (index) {
          if (MetronomeBrain.isPlaying()) MetronomeBrain.togglePlaying();
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.center,
        selectedIndex: _currentIndex,
        showElevation: false, // use this to remove appBar's elevation
        backgroundColor: kBottomNavyBarColor,
        itemCornerRadius: 2.0,
        containerHeight: 58.0,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.touch_app),
            title: Text('Bpm'),
            activeColor: Colors.white,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.timer),
            title: Text('Metronome'),
            activeColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
