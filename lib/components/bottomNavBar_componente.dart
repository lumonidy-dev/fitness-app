import 'package:fitness/pages/mealPlanner.dart';
import 'package:fitness/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitness/pages/home.dart';
import 'package:fitness/pages/activityTracker.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const MyBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/Homev2.svg'),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset('assets/icons/Activity.svg'),
            onPressed: () {},
          ),
          const SizedBox(), // Espacio en blanco para el FAB
          IconButton(
            icon: SvgPicture.asset('assets/icons/Document.svg'),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset('assets/icons/Profile.svg'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
