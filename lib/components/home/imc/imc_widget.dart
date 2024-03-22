import 'package:flutter/material.dart';
import 'package:fitness/models/imc/imc_data.dart';
import 'package:fitness/pages/imc/details_screen.dart';

class IMCWidget extends StatelessWidget {
  final IMCData imcData;
  final VoidCallback? onTap;

  const IMCWidget({Key? key, required this.imcData, this.onTap})
      : super(key: key);

  // Estilos generales
  static const Color primaryColor = Color(0xFF92A3FD);
  static const Color secondaryColor = Color(0xFF9DCEFF);
  static const double borderRadius = 22.0;
  static const double boxShadowBlurRadius = 22.0;
  static const Offset boxShadowOffset = Offset(0, 10);
  static const Color boxShadowColor = Color.fromARGB(30, 149, 174, 254);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
        child: buildContainer(context),
      ),
    );
  }

  Widget buildContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 32.0, bottom: 16.0),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(30, 149, 174, 254),
            blurRadius: 22.0,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(22)),
        gradient: LinearGradient(
          colors: [primaryColor, secondaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          leftSide(context),
          const Spacer(),
          rightSide(),
        ],
      ),
    );
  }

  Widget leftSide(BuildContext context) {
    final Color statusTextColor = getIMCStatusColor(imcData.imc);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          imcData.nombre,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Text(
              imcData.status,
              style: TextStyle(
                color: statusTextColor,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(width: 8.0),
            _buildEmoji(imcData.imc),
          ],
        ),
        const SizedBox(height: 8.0),
        botonVerMas(context), // Pasa el contexto aquí
      ],
    );
  }

  Widget rightSide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'IMC',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          imcData.imc.toStringAsFixed(2),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Peso: ${imcData.peso} kg',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Altura: ${imcData.altura} m',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

// todo: Elegir bien los colores
  Color getIMCStatusColor(double imc) {
    if (imc < 18.5) {
      return Colors.red;
    } else if (imc >= 18.5 && imc < 24.9) {
      return Colors.green;
    } else if (imc >= 24.9 && imc < 29.9) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  Widget botonVerMas(BuildContext context) {
    const primary = Color(0xFFC58BF2);
    const secondary = Color(0xFFEEA4CE);

    void navigateToIMCDetailScreen(BuildContext context, IMCData imcData) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IMCDetailScreen(imcData: imcData),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        // Llama a la función que navega a la pantalla de detalles
        navigateToIMCDetailScreen(context, imcData);
      },
      child: Container(
        width: 120,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [primary, secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Text(
            'Ver más',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmoji(double imc) {
    String emoji;

    if (imc < 18.5) {
      emoji = '😞'; // Emoji para bajo peso
    } else if (imc >= 18.5 && imc < 24.9) {
      emoji = '😊'; // Emoji para peso normal
    } else if (imc >= 24.9 && imc < 29.9) {
      emoji = '😐'; // Emoji para sobrepeso
    } else {
      emoji = '😞'; // Emoji para obeso
    }

    return Text(
      emoji,
      style: const TextStyle(
        fontSize: 24.0,
      ),
    );
  }
}
