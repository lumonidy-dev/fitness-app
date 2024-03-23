import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fitness/models/imc/imc_category.dart';

class ArcPieChart extends StatelessWidget {
  final double currentValue;

  ArcPieChart({required this.currentValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Ancho deseado
      height: 200, // Alto deseado
      child: CustomPaint(
        painter: ArcPieChartPainter(currentValue: currentValue),
      ),
    );
  }
}

class ArcPieChartPainter extends CustomPainter {
  final double currentValue;
  Paint needlePaint = Paint()
    ..color = Colors.black
    ..strokeWidth = 2.0;

  ArcPieChartPainter({required this.currentValue});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    List<IMCCategory> categories = [
      IMCCategory(name: 'Delgadez', min: 12, max: 18.4),
      IMCCategory(name: 'Normal', min: 18.5, max: 24.9),
      IMCCategory(name: 'Sobrepeso', min: 25, max: 39.9),
    ];

    const totalDegrees = 180.0;
    final anglePerCategory = totalDegrees / categories.length;

    final arcPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30.0;

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (int i = 0; i < categories.length; i++) {
      final startAngle = pi + i * anglePerCategory * (pi / 180);
      final sweepAngle = anglePerCategory * (pi / 180);

      arcPaint.color = _getCategoryColor(categories[i], currentValue);

      // Dibujar arco con un pequeño espacio de separación
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle + 0.02, // Ajuste de separación
        sweepAngle - 0.04, // Ajuste de separación
        false,
        arcPaint,
      );

      // Calcular ángulo medio
      final middleAngle = startAngle + (sweepAngle / 2);

      // Calcular posición del texto
      final textRadius = radius * 0.8; // Radio para el texto
      final textX = center.dx + textRadius * cos(middleAngle);
      final textY = center.dy + textRadius * sin(middleAngle);

      // Calcular inclinación del texto
      final textAngle = middleAngle + pi / 2;

      // Dibujar texto inclinado
      final textSpan = TextSpan(
        text: categories[i].name,
        style: const TextStyle(
            color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
      );
      textPainter.text = textSpan;
      textPainter.layout();
      canvas.save();
      canvas.translate(textX, textY);
      canvas.rotate(textAngle);
      textPainter.paint(
          canvas, Offset(-textPainter.width / 2, -textPainter.height * pi / 2));
      canvas.restore();
    }

    // Dibujar aguja
    const needleLength = 1; // Longitud de la aguja

    double normalizedValue = currentValue;
// Asegurar que el valor actual esté dentro de los límites de las categorías
    if (currentValue < categories.first.min) {
      normalizedValue = categories.first.min;
    } else if (currentValue > categories.last.max) {
      normalizedValue = categories.last.max;
    }

    final angle = pi +
        ((normalizedValue - categories.first.min) /
                (categories.last.max - categories.first.min)) *
            totalDegrees *
            (pi / 180);

    const additionalDegrees = 2;
    var adjustedAngle = angle + additionalDegrees * (pi / 180);
    if (angle > pi) {
      // La aguja está hacia la izquierda del centro
      adjustedAngle = angle - (additionalDegrees * (pi / 180));
    } else {
      // La aguja está hacia la derecha del centro
      adjustedAngle = angle + (additionalDegrees * (pi / 180));
    }

    final needleEndX = center.dx + needleLength * cos(adjustedAngle);
    final needleEndY = center.dy + needleLength * sin(adjustedAngle);
    final needleStartX = center.dx + (radius - 10) * cos(adjustedAngle);
    final needleStartY = center.dy + (radius - 10) * sin(adjustedAngle);
    canvas.drawLine(
      Offset(needleStartX, needleStartY),
      Offset(needleEndX, needleEndY),
      needlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Color _getCategoryColor(IMCCategory category, double currentValue) {
    Color arcColor;
    if (category.name == 'Delgadez') {
      arcColor = Colors.blue;
    } else if (category.name == 'Normal') {
      arcColor = Colors.green;
    } else if (category.name == 'Sobrepeso') {
      arcColor = Colors.red;
    } else {
      arcColor = Colors.grey;
    }
    return arcColor;
  }
}
