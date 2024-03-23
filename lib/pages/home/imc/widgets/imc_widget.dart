import 'package:flutter/material.dart';
import 'package:fitness/models/imc/imc_data.dart';
import 'package:fitness/pages/home/imc_details.dart';

class IMCWidget extends StatelessWidget {
  final IMCData imcData;
  final VoidCallback? onTap;

  const IMCWidget({Key? key, required this.imcData, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(30, 149, 174, 254),
                blurRadius: 22.0,
                offset: Offset(0, 10),
              ),
            ],
            gradient: const LinearGradient(
              colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              _buildLeftSide(context),
              const Spacer(),
              _buildRightSide(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeftSide(BuildContext context) {
    final Color statusTextColor = imcData.getIMCStatusColor(imcData.imc);
    final String emoji = imcData.getEmoji(imcData.imc);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          imcData.nombre,
          style: const TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Text(
              imcData.status,
              style: TextStyle(color: statusTextColor, fontSize: 16.0),
            ),
            const SizedBox(width: 8.0),
            Text(
              emoji,
              style: const TextStyle(fontSize: 24.0),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        _buildButton(context),
      ],
    );
  }

  Widget _buildRightSide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'IMC',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        const SizedBox(height: 8.0),
        Text(
          imcData.imc.toStringAsFixed(2),
          style: const TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(
          '${imcData.peso} ${imcData.unidadPeso} \n ${imcData.altura} ${imcData.unidadAltura}',
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => IMCDetailScreen(imcData: imcData)),
      ),
      child: Container(
        width: 120,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Color(0xFFC58BF2), Color(0xFFEEA4CE)],
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
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
