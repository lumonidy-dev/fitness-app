import 'package:flutter/material.dart';

class IconBar extends StatelessWidget {
  final Widget startIcon; // Icono al inicio
  final Widget endIcon; // Icono al final

  const IconBar({
    Key? key,
    required this.startIcon,
    required this.endIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        startIcon,
        SizedBox(width: 310), // Espacio entre los iconos (ajustable
        endIcon,
      ],
    );
  }
}
