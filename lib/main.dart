import 'package:flutter/material.dart';
import 'package:fitness/pages/mealPlanner.dart';
import 'package:fitness/pages/home.dart';
import 'package:fitness/pages/activityTracker.dart';
import 'package:fitness/pages/profile.dart';
import 'package:fitness/components/iconos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const PageViewDemo(),
    );
  }
}

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({Key? key}) : super(key: key);

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  final PageController _pageController = PageController();
  int _selectedPage = 0;
  final double bottomNavBarHeightPercentage = 0.1;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _buildPageView(),
          ),
          _buildBottomNav(),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF99DCEFF),
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedPage,
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(label: "Home", icon: AppIcons.home()),
          BottomNavigationBarItem(label: "Tracker", icon: AppIcons.activity()),
          BottomNavigationBarItem(label: "Planner", icon: AppIcons.planner()),
          BottomNavigationBarItem(label: "Profile", icon: AppIcons.profile())
        ],
        onTap: (int index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        },
      ),
    );
  }

  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: onPageChange,
      children: [
        HomePage(),
        ActivityTracker(),
        MealPlanner(),
        Profile(),
      ],
    );
  }

  void onPageChange(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
