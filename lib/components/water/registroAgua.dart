import 'package:flutter/material.dart';

class RegistroAgua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 300,
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: tablaRecordatorio(),
      ),
    );
  }

  DataTable tablaRecordatorio() {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            '',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Hora',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Cantidad',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            '',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Icon(Icons.access_time)),
            DataCell(Text('8:00')),
            DataCell(Text('200 ml')),
            DataCell(Icon(Icons.more_horiz)),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Icon(Icons.access_time)),
            DataCell(Text('10:00')),
            DataCell(Text('200 ml')),
            DataCell(Icon(Icons.more_horiz)),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Icon(Icons.access_time)),
            DataCell(Text('12:00')),
            DataCell(Text('200 ml')),
            DataCell(Icon(Icons.more_horiz)),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Icon(Icons.access_time)),
            DataCell(Text('14:00')),
            DataCell(Text('200 ml')),
            DataCell(Icon(Icons.more_horiz)),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Icon(Icons.access_time)),
            DataCell(Text('16:00')),
            DataCell(Text('200 ml')),
            DataCell(Icon(Icons.more_horiz)),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Icon(Icons.access_time)),
            DataCell(Text('18:00')),
            DataCell(Text('200 ml')),
            DataCell(Icon(Icons.more_horiz)),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Icon(Icons.access_time)),
            DataCell(Text('20:00')),
            DataCell(Text('200 ml')),
            DataCell(Icon(Icons.more_horiz)),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Icon(Icons.access_time)),
            DataCell(Text('22:00')),
            DataCell(Text('200 ml')),
            DataCell(Icon(Icons.more_horiz)),
          ],
        ),
      ],
    );
  }
}
