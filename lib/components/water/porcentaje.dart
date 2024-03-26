import 'package:flutter/material.dart';

class Porcentaje extends StatelessWidget {
  final int numerator = 500; // Numerador
  final int denominator = 2000; // Denominador

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.transparent,
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Color del texto
          ),
          children: [
            TextSpan(
                text: '$numerator',
                style:
                    TextStyle(color: Colors.blue)), // Estilo para el numerador
            TextSpan(text: '/$denominator'),
          ],
        ),
      ),
    );
  }
}
