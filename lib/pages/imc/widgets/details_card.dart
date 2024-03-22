import 'package:flutter/material.dart';
import 'package:fitness/models/imc/imc_data.dart';

Widget detailsCard(
    IMCData imcData, bool isExpanded, ValueChanged<bool> onExpand) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
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
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSingleDetail(imcData, isExpanded),
            if (isExpanded) ...[
              _buildNombre(imcData),
              const SizedBox(height: 16),
              _buildDetailRow('IMC', imcData.imc.toStringAsFixed(2)),
              _buildDetailRow('Peso', '${imcData.peso} ${imcData.unidadPeso}'),
              _buildDetailRow(
                'Sexo',
                imcData.sexo == 1 ? 'Masculino' : 'Femenino',
              ),
              _buildDetailRow(
                'Altura',
                '${imcData.altura} ${imcData.unidadAltura}',
              ),
              _buildDetailRow('Edad', imcData.edad.toString()),
              _buildDetailRow('Estado', imcData.status),
            ],
            GestureDetector(
              onTap: () {
                onExpand(!isExpanded);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildNombre(IMCData imcData) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      imcData.nombre,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

Widget _buildSingleDetail(IMCData imcData, bool isExpanded) {
  final Color statusTextColor = imcData.getIMCStatusColor(imcData.imc);
  final String emoji = imcData.getEmoji(imcData.imc);

  return Visibility(
    visible: !isExpanded,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MainTitle(imcData, statusTextColor, emoji),
        Details(imcData),
      ],
    ),
  );
}

Widget MainTitle(IMCData imcData, Color statusTextColor, String emoji) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: Column(
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
              style: TextStyle(color: statusTextColor, fontSize: 16.0),
            ),
            const SizedBox(width: 8.0),
            Text(
              emoji,
              style: const TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget Details(IMCData imcData) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: Column(
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
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          '${imcData.peso} ${imcData.unidadPeso} \n ${imcData.altura} ${imcData.unidadAltura}',
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ],
    ),
  );
}

Widget _buildDetailRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    ),
  );
}
