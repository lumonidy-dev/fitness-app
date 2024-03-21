import 'package:flutter/material.dart';
import 'package:fitness/models/imc/imc_data.dart';

class IMCWidget extends StatelessWidget {
  final IMCData imcData;
  final VoidCallback? onTap; // Agregar el parámetro onTap

  const IMCWidget({Key? key, required this.imcData, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Utiliza GestureDetector para manejar onTap
      onTap: onTap, // Llama a la función onTap si se proporciona
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre: ${imcData.nombre}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'IMC: ${imcData.imc.toStringAsFixed(2)} (${imcData.status})',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Peso: ${imcData.peso} kg',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            _buildEmoji(imcData.imc),
          ],
        ),
      ),
    );
  }

  Widget _buildEmoji(double imc) {
    IconData icon;
    Color color;

    if (imc < 18.5) {
      icon = Icons.sentiment_very_dissatisfied;
      color = Colors.red;
    } else if (imc >= 18.5 && imc < 24.9) {
      icon = Icons.sentiment_satisfied;
      color = Colors.green;
    } else if (imc >= 24.9 && imc < 29.9) {
      icon = Icons.sentiment_neutral;
      color = Colors.orange;
    } else {
      icon = Icons.sentiment_very_dissatisfied;
      color = Colors.red;
    }

    return Icon(
      icon,
      color: color,
      size: 40.0,
    );
  }
}
