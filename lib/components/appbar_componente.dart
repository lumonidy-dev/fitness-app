import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarComponente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Desayuno 1.1.0',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          print("go to back page");
        },
        child: Container(
          width: 30,
          height: 30,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/BC.svg',
            height: 20,
            width: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            print('menu button pressed');
          },
          child: Container(
            width: 37,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
          ),
        ),
      ],
    );
  }
}
