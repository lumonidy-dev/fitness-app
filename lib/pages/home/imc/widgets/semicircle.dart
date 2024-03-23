import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fitness/models/imc/imc_categories.dart';

class ArcPieChart extends StatelessWidget {
  final double currentValue;

  const ArcPieChart({Key? key, required this.currentValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Asumiendo que queremos un tamaño fijo para el gráfico.
    const double chartDiameter = 200.0;
    const double strokeWidth = 30.0;
    const double shadowOffset = 5.0; // Espacio para la sombra

    // Aumentamos el tamaño del contenedor para que la sombra quepa sin cortar el gráfico.
    const double containerSize = chartDiameter + strokeWidth + shadowOffset * 2;

    return Center(
      child: Container(
        width: containerSize,
        height: (containerSize / 2 + 20),
        decoration: BoxDecoration(
          // Necesitamos border radius en left top y right top para que el contenedor sea redondeado.
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(chartDiameter),
            topRight: Radius.circular(chartDiameter),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          color: Colors
              .white, // Un fondo para asegurarnos de que la sombra se vea.
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 5), // Posición de la sombra
            ),
          ],
        ),
        child: CustomPaint(
          size: const Size(chartDiameter, chartDiameter),
          painter: ArcPieChartPainter(
            currentValue: currentValue,
            strokeWidth: strokeWidth,
            shadowOffset: shadowOffset,
          ),
        ),
      ),
    );
  }
}

class ArcPieChartPainter extends CustomPainter {
  final double currentValue;
  final double strokeWidth;
  final double shadowOffset;

  ArcPieChartPainter({
    required this.currentValue,
    required this.strokeWidth,
    required this.shadowOffset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, (size.height - 20));
    final radius = size.width / 2 - strokeWidth / 2 - shadowOffset;

    final categories = categoriesFromChart;
    final double totalRange = categories.last.max - categories.first.min;
    const totalDegrees = pi;

    final arcPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final double startRadius = radius - strokeWidth;
    const double textOffset = 2;
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 10.0,
    );

    const categoriesStyle = TextStyle(
      color: Colors.white,
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    );
    // Dibuja arcos y textos
    double startAngle = pi;
    for (int i = 0; i < categories.length; i++) {
      final category = categories[i];
      final sweepAngle = (category.max - category.min) /
          (categories.last.max - categories.first.min) *
          totalDegrees;
      arcPaint.color = getCategoryColor(categories[i]);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle +
            0.01, // Añade un pequeño offset para evitar superposición de arcos
        sweepAngle - 0.02,
        false,
        arcPaint,
      );

      drawCategories(canvas, center, radius, startRadius, startAngle,
          sweepAngle, category, textOffset, categoriesStyle);

      // Solo dibuja el valor mínimo de cada categoría al inicio de cada tramo
      drawLimit(canvas, center, startRadius - textOffset, startAngle,
          '${category.min}', textStyle);

      // En el último tramo, dibuja también el valor máximo al final
      if (i == categories.length - 1) {
        drawLimit(canvas, center, startRadius - textOffset,
            startAngle + sweepAngle, '${category.max}', textStyle);
      }

      // Para el siguiente arco
      startAngle += sweepAngle;
    }

    // Dibuja la flecha
    drawArrow(canvas, center, radius, categories, totalDegrees);

    // Dibuja el IMC en el centro
    drawIMC(canvas, size);
  }

  void drawCategories(
      Canvas canvas,
      Offset center,
      double radius,
      double startRadius,
      double startAngle,
      double sweepAngle,
      IMCCategory category,
      double textOffset,
      TextStyle textStyle) {
    // Calcula el ángulo medio del tramo
    final middleAngle = startAngle + (sweepAngle / 2);

    // Calcula la posición del texto centrado en el tramo
    final textX = center.dx + radius * cos(middleAngle);
    final textY = center.dy + radius * sin(middleAngle);

    // Crea el TextSpan con el nombre de la categoría y el estilo de texto proporcionado
    final textSpan = TextSpan(
      text: category.name,
      style: textStyle,
    );

    // Crea un TextPainter para pintar el texto
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    // Realiza el layout del texto para obtener sus dimensiones
    textPainter.layout();

    // Guarda el estado actual del canvas
    canvas.save();

    // Mueve el canvas a la posición calculada para el texto
    canvas.translate(textX, textY);

    // Rota el canvas para que el texto siga la curva del tramo
    canvas.rotate(middleAngle + pi / 2); // Agrega un cuarto de vuelta

    // Pinta el texto en el canvas, centrado horizontal y verticalmente
    textPainter.paint(
      canvas,
      Offset(-textPainter.width / 2, -textPainter.height / 2),
    );

    // Restaura el estado del canvas
    canvas.restore();
  }

  void drawIMC(Canvas canvas, Size size) {
    final centroX = size.width / 2;
    final centroY = size.height / 2;
    final category = getCategoryFromIMC(currentValue);

    final textSpan = TextSpan(
      text: currentValue.toStringAsFixed(1),
      style: TextStyle(
        color: getCategoryTextColor(category),
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final emojiSpan = TextSpan(
      text: getEmojiFromIMC(currentValue),
      style: const TextStyle(fontSize: 32.0),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final emojiPainter = TextPainter(
      text: emojiSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    emojiPainter.layout();

    // Calcular la posición para colocar el texto en el centro del contenedor
    final textX = centroX - textPainter.width / 2;
    final textY = centroY - textPainter.height / 2;

    final emojiX = centroX - emojiPainter.width / 2;
    final emojiY = centroY - emojiPainter.height / 2;

    canvas.save();

    canvas.translate(emojiX, emojiY);
    emojiPainter.paint(canvas, Offset.zero);
    canvas.restore();

    canvas.save();

    canvas.translate(textX, textY + 48);
    textPainter.paint(canvas, Offset.zero);
    canvas.restore();
  }

  void drawLimit(Canvas canvas, Offset center, double radius, double angle,
      String text, TextStyle textStyle) {
    // Crea un TextPainter con el text y textStyle proporcionados
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(); // Asegúrate de hacer el layout del texto

    // Calcula la posición correcta del texto
    final xPos = center.dx + radius * cos(angle);
    final yPos = center.dy + radius * sin(angle);

    canvas.save(); // Guarda el estado actual del canvas
    canvas.translate(xPos, yPos); // Mueve el canvas a la posición calculada
    canvas.rotate(
        angle + pi / 2); // Rota el canvas para que el texto siga el arco

    // Dibuja el texto
    textPainter.paint(
        canvas, Offset(-textPainter.width / 2, -textPainter.height));

    canvas.restore(); // Restaura el estado del canvas
  }

  void drawArrow(Canvas canvas, Offset center, double radius,
      List<IMCCategory> categories, double totalDegrees) {
    final normalizedValue =
        currentValue.clamp(categories.first.min, categories.last.max);
    double angle = pi +
        (normalizedValue - categories.first.min) /
            (categories.last.max - categories.first.min) *
            totalDegrees;

    const double adjustmentAngle =
        2 * (pi / 180); // 2 grados convertidos a radianes
    double angleDegrees = angle * (180 / pi); // Convertir radianes a grados

    // print('Ángulo de la flecha: $angleDegrees'); // Depuración del ángulo

    // Tamaño y estilo de la flecha
    const double arrowLength = 16.0; // longitud de la flecha
    const double arrowWidth = 12.0; // ancho de la base de la flecha

    Offset displacementVector;

    // Cálculo de la punta de la flecha
    double arrowTipAdjustment =
        arrowLength / 4; // Ajusta la distancia de la punta a la base
    if (angleDegrees >= 0 && angleDegrees <= 210) {
      // Desplazamiento adicional para ángulos entre 0 y 45 grados
      displacementVector = const Offset(2, 0);
    } // entre 46 y 90 grados
    else if (angleDegrees >= 220 && angleDegrees <= 225) {
      // Desplazamiento adicional para ángulos entre 180 y 225 grados
      displacementVector = const Offset(0, 8);
    } // entre 226 y 270 grados
    else if (angleDegrees > 225 && angleDegrees <= 270) {
      displacementVector = const Offset(-2, 8);
    } // entre 271 y 315 grados
    else if (angleDegrees > 270 && angleDegrees <= 315) {
      displacementVector = const Offset(0, 10);
    } // entre 316 y 360 grados
    else if (angleDegrees > 315 && angleDegrees <= 360) {
      displacementVector = const Offset(-12, -4);
    } else {
      displacementVector =
          const Offset(-10, 6); // Desplazamiento estándar hacia la derecha
      if (currentValue >= 37) {
        // Dejar la y del offset en 0.
        displacementVector = const Offset(-10, 0);
      }
    }

    final centerOffset = center + displacementVector;
    final arrowTipX =
        centerOffset.dx + radius * cos(angle) + arrowTipAdjustment;
    final arrowTipY = centerOffset.dy + radius * sin(angle);

    // Cálculo de los otros dos puntos de la base de la flecha
    final double arrowAngle = atan(arrowWidth /
        arrowLength); // Ángulo en la punta de la flecha para calcular la base
    final double arrowBaseLeftX =
        arrowTipX - arrowLength * cos(angle + arrowAngle);
    final double arrowBaseLeftY =
        arrowTipY - arrowLength * sin(angle + arrowAngle);
    final double arrowBaseRightX =
        arrowTipX - arrowLength * cos(angle - arrowAngle);
    final double arrowBaseRightY =
        arrowTipY - arrowLength * sin(angle - arrowAngle);

    // Cálculo de los puntos de la curva en la base de la flecha
    final double curveControlX = arrowTipX - arrowLength * 0.3 * cos(angle);
    final double curveControlY = arrowTipY - arrowLength * 0.3 * sin(angle);

    // Dibujar el borde de la flecha
    final Paint borderPaint = Paint()
      ..color = Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final Path borderPath = Path();
    borderPath.moveTo(
        arrowBaseLeftX, arrowBaseLeftY); // Punto inicial en la base izquierda
    borderPath.quadraticBezierTo(curveControlX, curveControlY, arrowBaseRightX,
        arrowBaseRightY); // Curva en la base
    borderPath.lineTo(arrowTipX, arrowTipY); // Línea a la punta de la flecha
    borderPath.close(); // Cierra el path
    canvas.drawPath(borderPath, borderPaint);

    // Dibujar el relleno de la flecha
    final Paint fillPaint = Paint()
      ..color = Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill;
    canvas.drawPath(borderPath, fillPaint);
  }

  void drawText(
      Canvas canvas, Offset center, double radius, double angle, String text) {
    final textRadius = radius * 0.97;
    final textX = center.dx + textRadius * cos(angle);
    final textY = center.dy + textRadius * sin(angle);
    final textAngle = angle + pi / 2;

    final textSpan = TextSpan(
      text: text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14.0,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    canvas.save();
    canvas.translate(textX, textY);
    canvas.rotate(textAngle);
    textPainter.paint(
        canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      false; // No necesita repintar si los datos no cambian.
}
