import 'package:flutter/material.dart';
import 'package:fitness/models/imc/imc_data.dart';
import 'package:fitness/models/imc/imc_categories.dart';

class IMCTable extends StatelessWidget {
  final IMCData imcData;

  const IMCTable({Key? key, required this.imcData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Categoría')),
        DataColumn(label: Text('Rango')),
      ],
      rows: imcCategories.map((category) {
        final isInRange = isInCategory(imcData.imc, category);

        return DataRow(
          color: MaterialStateColor.resolveWith(
              (states) => isInRange ? Colors.greenAccent : Colors.transparent),
          cells: [
            DataCell(
              Text(
                category.name,
                style: TextStyle(
                  fontWeight: isInRange ? FontWeight.bold : FontWeight.normal,
                  color: isInRange ? Colors.green : Colors.black,
                ),
              ),
            ),
            DataCell(
              Text(getRangeString(category)),
            ),
          ],
        );
      }).toList(),
    );
  }

  bool isInCategory(double imc, IMCCategory category) {
    if (category.min == double.negativeInfinity) {
      return imc <= category.max;
    } else if (category.max == double.infinity) {
      return imc >= category.min;
    } else {
      return imc >= category.min && imc <= category.max;
    }
  }

  String getRangeString(IMCCategory category) {
    if (category.min == double.negativeInfinity) {
      return '(≤ ${category.max})';
    } else if (category.max == double.infinity) {
      return '(≥ ${category.min})';
    } else {
      return '(${category.min}-${category.max})';
    }
  }
}
