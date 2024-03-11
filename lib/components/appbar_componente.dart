import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitness/pages/mealPlanner.dart';

class AppBarComponente extends StatelessWidget {
  final String title;
  final VoidCallback? onBackButtonPressed; // Función opcional para el botón de atrás
  final VoidCallback? onMenuButtonPressed; // Función opcional para el botón de menú

  const AppBarComponente({
    Key? key,
    required this.title,
    this.onBackButtonPressed,
    this.onMenuButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w900,
        ),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: onBackButtonPressed ?? () {}, // Llama a la función si está definida, o no hace nada
        child: Container(
          width: 30,
          height: 30,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Transform.scale(
              scale: 1.2,
              child: SvgPicture.asset(
                'assets/icons/Arrow - Left 2.svg',
              ),
            ),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: onMenuButtonPressed ?? () {}, // Llama a la función si está definida, o no hace nada
          child: Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Transform.scale(
                scale: 1.2,
                child: SvgPicture.asset('assets/icons/dots.svg'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
