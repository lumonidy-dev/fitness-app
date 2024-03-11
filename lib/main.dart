import 'package:fitness/pages/mealPlanner.dart';
import 'package:flutter/material.dart';
import 'package:fitness/pages/home.dart';
import 'package:fitness/pages/activityTracker.dart';
import 'package:fitness/pages/profile.dart';
import 'package:fitness/components/bottomNavBar_componente.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        home: PageViewDemo());
  }
}

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({Key? key}) : super(key: key);

  @override
  State<PageViewDemo> createState() => MyHomie();
}

class MyHomie extends State<PageViewDemo> {
  final PageController _pageController = PageController();
  int selectedPage = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [buildPageView(), buildBottomNav()]),
    );
  }

  Widget buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: selectedPage,
      items: const [
        BottomNavigationBarItem(label: "Page1", icon: Icon(Icons.pages)),
        BottomNavigationBarItem(label: "Page2", icon: Icon(Icons.pages)),
        BottomNavigationBarItem(label: "Page3", icon: Icon(Icons.pages)),
        BottomNavigationBarItem(label: "Page4", icon: Icon(Icons.pages)),
      ],
      onTap: (int index) {
        _pageController.animateToPage(index,
            duration: const Duration(microseconds: 1000), curve: Curves.easeIn);
      },
    );
  }

  Widget buildPageView() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.82,
      child: PageView(
        controller: _pageController,
        children: [
          HomePage(),
          ActivityTracker(),
          MealPlanner(),
          Profile(),
        ],
        onPageChanged: (index) {
          onPageChange(index);
        },
      ),
    );
  }

  onPageChange(int index) {
    setState(() {
      selectedPage = index;
    });
  }
}
