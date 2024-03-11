import 'package:flutter/material.dart';
import 'dart:math';

class RadarChartWidget extends StatelessWidget {
  final List<double> data;
  final double maxValue;

  RadarChartWidget({
    required this.data,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> labels = [
      'Energía',
      'Vitaminas y\nMinerales',
      'Azúcares',
      'Carbohidratos',
      'Grasas',
      'Proteínas',
      'Fibra',
      'Sodio',
    ];
    return CustomPaint(
      size: Size(230, 230), // Ajusta el tamaño del gráfico según sea necesario
      painter: RadarChartPainter(data, labels, maxValue),
    );
  }
}

class RadarChartPainter extends CustomPainter {
  final List<double> data;
  final List<String> labels;
  final double maxValue;

  RadarChartPainter(this.data, this.labels, this.maxValue);

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = min(size.width / 2, size.height / 2);
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    Paint paint = Paint()
      ..color = Colors.blue.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    Paint linePaint = Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    // Dibuja el polígono de fondo
    Paint backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.4) // Hace el relleno transparente
      ..style = PaintingStyle.stroke // Establece el estilo de trazo
      ..strokeWidth = 2; // Grosor del trazo

    Path backgroundPolygon = Path();
    for (int i = 0; i < data.length; i++) {
      double x = centerX + radius * cos(2 * pi * i / data.length);
      double y = centerY + radius * sin(2 * pi * i / data.length);
      if (i == 0) {
        backgroundPolygon.moveTo(x, y);
      } else {
        backgroundPolygon.lineTo(x, y);
      }
    }
    backgroundPolygon.close();
    canvas.drawPath(backgroundPolygon, backgroundPaint);

    // Dibuja los polígonos interiores
    for (int percentage = 25; percentage <= 75; percentage += 25) {
      double innerRadius =
          radius * percentage / 100; // Calcula el radio del polígono interior

      Paint innerPolygonPaint = Paint()
        ..color = Colors.black.withOpacity(0.4) // Hace el relleno transparente
        ..style = PaintingStyle.stroke // Establece el estilo de trazo
        ..strokeWidth = 1; // Grosor del trazo

      Path innerPolygon = Path();
      for (int i = 0; i < data.length; i++) {
        double x = centerX + innerRadius * cos(2 * pi * i / data.length);
        double y = centerY + innerRadius * sin(2 * pi * i / data.length);
        if (i == 0) {
          innerPolygon.moveTo(x, y);
        } else {
          innerPolygon.lineTo(x, y);
        }
      }
      innerPolygon.close();
      canvas.drawPath(innerPolygon, innerPolygonPaint);
    }

    // Dibuja las líneas radiales
    for (int i = 0; i < data.length; i++) {
      double x = centerX + radius * cos(2 * pi * i / data.length);
      double y = centerY + radius * sin(2 * pi * i / data.length);
      canvas.drawLine(Offset(centerX, centerY), Offset(x, y), linePaint);
    }

    // Dibuja los valores en el gráfico
// Asigna manualmente las posiciones de los textos
    double textX;
    double textY;
    double fontSize = 12; // Tamaño de la fuente

// Texto para Energía
    textX = centerX + 125; // Ajusta la posición X según sea necesario
    textY = centerY - 6; // Ajusta la posición Y según sea necesario
    textPainter.text = TextSpan(
      text: 'Energía',
      style:
          TextStyle(color: Colors.black.withOpacity(0.6), fontSize: fontSize),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(textX, textY));

// Texto para Vitaminas y Minerales
    textX = centerX - 150; // Ajusta la posición X según sea necesario
    textY = centerY - radius; // Ajusta la posición Y según sea necesario
    textPainter.text = TextSpan(
      text: 'Vitaminas y\nMinerales',
      style:
          TextStyle(color: Colors.black.withOpacity(0.6), fontSize: fontSize),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(textX, textY));

// Texto para Azúcares
    textX = centerX - 25; // Ajusta la posición X según sea necesario
    textY = centerY - radius - 20; // Ajusta la posición Y según sea necesario

    textPainter.text = TextSpan(
      text: 'Azúcares',
      style:
          TextStyle(color: Colors.black.withOpacity(0.6), fontSize: fontSize),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(textX, textY));

// Texto para Carbohidratos
    textX = centerX - 165; // Ajusta la posición X según sea necesario
    textY = centerY + 80; // Ajusta la posición Y según sea necesario
    textPainter.text = TextSpan(
      text: 'Carbohidratos',
      style:
          TextStyle(color: Colors.black.withOpacity(0.6), fontSize: fontSize),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(textX, textY));

// Texto para Grasas
    textX = centerX - 20; // Ajusta la posición X según sea necesario
    textY = centerY + radius + 5; // Ajusta la posición Y según sea necesario
    textPainter.text = TextSpan(
      text: 'Grasas',
      style:
          TextStyle(color: Colors.black.withOpacity(0.6), fontSize: fontSize),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(textX, textY));

// Texto para Proteínas
    textX = centerX + 90; // Ajusta la posición X según sea necesario
    textY = centerY + 80; // Ajusta la posición Y según sea necesario
    textPainter.text = TextSpan(
      text: 'Proteínas',
      style:
          TextStyle(color: Colors.black.withOpacity(0.6), fontSize: fontSize),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(textX, textY));

// Texto para fibra
    textX = centerX - 154; // Ajusta la posición X según sea necesario
    textY = centerY - 8; // Ajusta la posición Y según sea necesario

    textPainter.text = TextSpan(
      text: 'Fibra',
      style:
          TextStyle(color: Colors.black.withOpacity(0.6), fontSize: fontSize),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(textX, textY));

// Texto para Sodio
    textX = centerX + 90; // Ajusta la posición X según sea necesario
    textY = centerY - radius + 20; // Ajusta la posición Y según sea necesario
    textPainter.text = TextSpan(
      text: 'Sodio',
      style:
          TextStyle(color: Colors.black.withOpacity(0.6), fontSize: fontSize),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(textX, textY));

    // Dibuja el polígono de datos
    Path dataPolygon = Path();
    for (int i = 0; i < data.length; i++) {
      double x =
          centerX + radius * data[i] / maxValue * cos(2 * pi * i / data.length);
      double y =
          centerY + radius * data[i] / maxValue * sin(2 * pi * i / data.length);
      if (i == 0) {
        dataPolygon.moveTo(x, y);
      } else {
        dataPolygon.lineTo(x, y);
      }
    }
    dataPolygon.close();
    paint.color = const Color(0xFFC30558).withOpacity(0.5);
    canvas.drawPath(dataPolygon, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
