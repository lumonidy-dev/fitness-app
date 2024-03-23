import 'package:flutter/material.dart';
import 'package:fitness/models/imc/imc_data.dart';

import 'imc/widgets/details_card.dart';
import 'imc/widgets/calculator_form.dart';
import 'imc/widgets/table.dart';
import 'imc/widgets/semicircle.dart';
import 'package:fitness/utils/anuncio.dart';
import 'package:fitness/utils/mockup_manager.dart';

class IMCDetailScreen extends StatefulWidget {
  final IMCData imcData;

  const IMCDetailScreen({Key? key, required this.imcData}) : super(key: key);

  @override
  _IMCDetailScreenState createState() => _IMCDetailScreenState();
}

class _IMCDetailScreenState extends State<IMCDetailScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del IMC'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailsCard(widget.imcData, _isExpanded, (bool value) {
                setState(() {
                  _isExpanded = value;
                });
              }),
              const SizedBox(height: 25),
              _buildApps(),
              IMCTable(imcData: widget.imcData),
              const SizedBox(height: 25),
              _buildAnuncio(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnuncio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
        ),
        Anuncio(
          htmlData: MockupManager.getNextMockup(),
        ),
      ],
    );
  }

  Widget _buildApps() {
    return Row(
      children: [
        // Columna para los botones con un factor flex menor porque requieren menos ancho
        Expanded(
          flex: 1, // Menos flexibilidad, ocupará menos espacio
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CalculatorForm(imcData: widget.imcData, buttonSize: 60),
              const SizedBox(height: 16), // Espacio entre los botones
              _infoButton(size: 60),
            ],
          ),
        ),
        // Chart con un factor flex mayor porque requiere más ancho
        Expanded(
          flex: 2, // Más flexibilidad, ocupará más espacio
          child: AspectRatio(
            aspectRatio: 1, // para mantener el gráfico cuadrado, por ejemplo
            child: ArcPieChart(currentValue: widget.imcData.imc),
          ),
        ),
      ],
    );
  }

  Widget _infoButton({required double size}) {
    return SizedBox(
      width: size,
      height: size,
      child: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Información'),
                content: const Text(
                    'El índice de masa corporal (IMC) es una medida de asociación entre el peso y la talla de una persona. Se calcula dividiendo el peso de una persona en kilogramos por el cuadrado de su talla en metros. \n No se debe tomar como única referencia para evaluar la salud de una persona, ya que no tiene en cuenta otros factores como la edad, el sexo, la masa muscular, la distribución de la grasa corporal, etc.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cerrar'),
                  ),
                ],
              );
            },
          );
        },
        mini: false,
        heroTag: null,
        backgroundColor: Colors.blue,
        elevation: 0,
        foregroundColor: Colors.white,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: const Icon(Icons.info, size: 24),
      ),
    );
  }
}
