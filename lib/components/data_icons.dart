// icons.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcons {
  static SvgPicture calorie() {
    return SvgPicture.asset(
      'assets/icons/calories.svg',
      colorFilter: const ColorFilter.mode(
          Color.fromARGB(255, 183, 27, 27), BlendMode.srcIn),
      height: 24,
      width: 24,
    );
  }

  static SvgPicture fats() {
    return SvgPicture.asset(
      'assets/icons/fats.svg',
      height: 20,
      width: 20,
    );
  }

  static SvgPicture proteins() {
    return SvgPicture.asset(
      'assets/icons/proteins.svg',
      height: 20,
      width: 20,
    );
  }

  static SvgPicture carbohydrates() {
    return SvgPicture.asset(
      'assets/icons/carbohydrates.svg',
      height: 20,
      width: 20,
    );
  }

  static SvgPicture vitamines() {
    return SvgPicture.asset(
      'assets/icons/carrot.svg',
      colorFilter: const ColorFilter.mode(
          Color.fromARGB(255, 244, 144, 5), BlendMode.srcIn),
      height: 20,
      width: 20,
    );
  }
}
