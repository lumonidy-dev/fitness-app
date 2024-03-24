import 'package:flutter/material.dart';

import 'package:fitness/models/actividadesDiarias/actividadesDiarias_model.dart';



Widget actividadesView(double height, DateTime? selectedDay) {
// Filtrar las actividades por fecha seleccionada
  List<Actividades> filteredActividades = actividades.where((actividad) {
    return actividad.date.year == selectedDay?.year &&
        actividad.date.month == selectedDay?.month &&
        actividad.date.day == selectedDay?.day;
  }).toList();

  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Container(
        height: height,
        width: 320,
        // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Actividades",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffADA4A5)),
            ),
            Expanded(
              child: ListaActividades(filteredActividades: filteredActividades),
            )
          ],
        )),
  );
}

class ListaActividades extends StatelessWidget {
  final List<Actividades> filteredActividades;

  const ListaActividades({Key? key, required this.filteredActividades})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: filteredActividades.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(
            filteredActividades[index].icon,
          ),
          title: Text(filteredActividades[index].title,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(filteredActividades[index].description,
              style: const TextStyle(fontWeight: FontWeight.normal)),
        );
      },
    );
  }
}
