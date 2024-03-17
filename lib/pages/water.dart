import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(Water());
}

class Water extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Half Circle Progress Bar'),
        ),
        body: Center(
          child: HalfCircleProgressBar(
            backgroundColor: Colors.grey,
            valueColor: Colors.blue,
            value:
                0.7, //aqui cambio el valor del porcentaje de agua que se muestra en la pantalla
            strokeWidth: 5,
            child: SvgPicture.asset(
              'assets/icons/bebeAgua.svg',
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}

class HalfCircleProgressBar extends StatelessWidget {
  final Color backgroundColor;
  final Color valueColor;
  final double value;
  final double strokeWidth;
  final Widget child;

  const HalfCircleProgressBar({
    Key? key,
    required this.backgroundColor,
    required this.valueColor,
    required this.value,
    required this.strokeWidth,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            foregroundPainter: HalfCircleProgressBarPainter(
              backgroundColor: backgroundColor,
              valueColor: valueColor,
              value: value,
              strokeWidth: strokeWidth,
            ),
            // Puedes dejar un contenedor vacío si no necesitas dibujar nada debajo del semicírculo
            size: Size(400, 100),
          ),
          Positioned(
            child: child,
          ),
        ],
      ),
    );
  }
}

class HalfCircleProgressBarPainter extends CustomPainter {
  final Color backgroundColor;
  final Color valueColor;
  final double value;
  final double strokeWidth;

  HalfCircleProgressBarPainter({
    required this.backgroundColor,
    required this.valueColor,
    required this.value,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width / 2, size.height);

    final double radius = size.width / 2 - strokeWidth / 2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi,
      false,
      paint,
    );

    paint.color = valueColor;
    final double sweepAngle = pi * value;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(HalfCircleProgressBarPainter oldDelegate) {
    return oldDelegate.value != value;
  }
}
