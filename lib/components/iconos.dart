// icons.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static SvgPicture home() {
    return SvgPicture.asset(
      'assets/icons/Homev2.svg',
      colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
      height: 24,
      width: 24,
    );
  }

  static SvgPicture activity() {
    return SvgPicture.asset(
      'assets/icons/Activity.svg',
      colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
      height: 24,
      width: 24,
    );
  }

  static SvgPicture planner() {
    return SvgPicture.asset(
      'assets/icons/Document.svg',
      colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
      height: 24,
      width: 24,
    );
  }

  static SvgPicture profile() {
    return SvgPicture.asset(
      'assets/icons/Profile.svg',
      colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
      height: 24,
      width: 24,
    );
  }
}
