import 'package:flutter/material.dart';
import 'package:fitness/models/imc/imc_data.dart';

class CalculatorForm extends StatefulWidget {
  final IMCData imcData;

  const CalculatorForm({
    Key? key,
    required this.imcData,
  }) : super(key: key);

  @override
  CalculatorFormState createState() => CalculatorFormState();
}

class CalculatorFormState extends State<CalculatorForm> {
  late TextEditingController alturaController;
  late TextEditingController pesoController;

  @override
  void initState() {
    super.initState();
    alturaController =
        TextEditingController(text: widget.imcData.altura.toString());
    pesoController =
        TextEditingController(text: widget.imcData.peso.toString());
  }

  @override
  void dispose() {
    alturaController.dispose();
    pesoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: alturaController,
                    decoration: InputDecoration(
                      labelText: 'Altura (${widget.imcData.unidadAltura})',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: pesoController,
                    decoration: InputDecoration(
                      labelText: 'Peso (${widget.imcData.unidadPeso})',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      double altura =
                          double.tryParse(alturaController.text) ?? 0.0;
                      double peso = double.tryParse(pesoController.text) ?? 0.0;

                      // Actualizar IMCData con los nuevos valores
                      widget.imcData.altura = altura;
                      widget.imcData.peso = peso;

                      // Calcular IMC usando IMCCalculator
                      double imc = IMCCalculator.calcularIMC(widget.imcData);
                      String imcStatus = IMCData.getIMCStatus(imc);

                      Navigator.pop(context); // Cerrar el formulario

                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    'IMC calculado: ${imc.toStringAsFixed(2)}'),
                                const SizedBox(height: 8),
                                Text('Estado: $imcStatus'),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(
                                        context); // Cerrar el resultado del IMC
                                  },
                                  child: const Text('Cerrar'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Text('Calcular IMC'),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const Icon(Icons.calculate),
    );
  }
}
