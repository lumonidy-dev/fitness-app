import 'package:flutter/material.dart';
import 'package:fitness/models/imc/imc_data.dart';

class CalculatorForm extends StatefulWidget {
  final IMCData imcData;
  final double buttonSize;

  const CalculatorForm({
    Key? key,
    required this.imcData,
    required this.buttonSize,
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.buttonSize,
      height: widget.buttonSize,
      child: FloatingActionButton(
        onPressed: _showModalCenter,
        mini: false,
        heroTag: null,
        backgroundColor: Colors.blue,
        elevation: 0,
        foregroundColor: Colors.white,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Icon(Icons.calculate, size: widget.buttonSize * 0.8),
      ),
    );
  }

  void _showModalCenter() {
    double screenWidth = MediaQuery.of(context).size.width;
    double dialogWidth = screenWidth * 0.8; // El 80% del ancho de la pantalla

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            // Use Material para asegurar que el diálogo tenga un fondo blanco
            borderRadius:
                BorderRadius.circular(8.0), // Bordes redondeados si lo desea
            elevation: 4.0, // Elevación del diálogo
            child: Container(
              width: dialogWidth,
              padding: const EdgeInsets.all(24.0), // Añade un relleno interno
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Ingrese los datos',
                      style: TextStyle(fontSize: 24)),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: alturaController,
                    decoration: InputDecoration(
                      labelText: 'Altura (${widget.imcData.unidadAltura})',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: pesoController,
                    decoration: InputDecoration(
                      labelText: 'Peso (${widget.imcData.unidadPeso})',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      _calcularIMC();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Calcular IMC'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _calcularIMC() {
    double altura = double.tryParse(alturaController.text) ?? 0.0;
    double peso = double.tryParse(pesoController.text) ?? 0.0;

    widget.imcData.altura = altura;
    widget.imcData.peso = peso;

    double imc = IMCCalculator.calcularIMC(widget.imcData);
    String imcStatus = IMCData.getIMCStatus(imc);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado del IMC'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('IMC calculado: ${imc.toStringAsFixed(2)}'),
              const SizedBox(height: 8),
              Text('Estado: $imcStatus'),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
