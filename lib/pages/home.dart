import 'package:flutter/material.dart';
import 'package:fitness/components/home/imc/imc_widget.dart';
import 'package:fitness/models/imc/imc_data.dart'; // Importa el modelo IMCData

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          IMCWidget(
            imcData: IMCData.getTestData(),
          )
        ],
      ),
    );
  }
}
