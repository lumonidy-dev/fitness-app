import 'package:flutter/material.dart';
import 'package:fitness/models/imc/imc_data.dart';

class IMCDetailScreen extends StatelessWidget {
  final IMCData imcData;

  const IMCDetailScreen({Key? key, required this.imcData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Nombre: ${imcData.nombre}'),
            Text('IMC: ${imcData.imc}'),
            Text('Peso: ${imcData.peso}'),
            Text('Altura: ${imcData.altura}'),
            Text('Status: ${imcData.status}'),
          ],
        ),
      ),
    );
  }
}
