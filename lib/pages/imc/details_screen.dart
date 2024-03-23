import 'package:flutter/material.dart';
import 'package:fitness/models/imc/imc_data.dart';

import 'widgets/details_card.dart';
import 'widgets/calculator_form.dart';
import 'widgets/table.dart';
import 'widgets/semicircle.dart';

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
              const SizedBox(height: 20),
              _buildApps(),

              // IMCTable(imcData: widget.imcData),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildApps() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CalculatorForm(imcData: widget.imcData, buttonSize: 72),
        const SizedBox(height: 20),
        ArcPieChart(
          currentValue: widget.imcData.imc,
        )
      ],
    );
  }
}
