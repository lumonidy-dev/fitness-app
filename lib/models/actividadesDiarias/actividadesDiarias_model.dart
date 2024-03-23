import 'package:flutter/material.dart';


class Actividades {
  final IconData icon;
  final String title;
  final String description;
  final DateTime date;

  Actividades(
      {required this.icon,
      required this.title,
      required this.description,
      required this.date});
}

class ActividadesRepository {
  static List<Actividades> getActividades() {
    return _getMockup();
  }

  static List<Actividades> _getMockup() {
    return actividades;
  }
}

List<Actividades> actividades = [
  Actividades(
      icon: Icons.directions_run,
      title: "Correr",
      description: "Correr 5km",
      date: DateTime.parse("2024-03-19")),
  Actividades(
      icon: Icons.directions_bike,
      title: "Bicicleta",
      description: "Bicicleta 10km",
      date: DateTime.parse("2024-03-20")),
  Actividades(
      icon: Icons.directions_walk,
      title: "Caminar",
      description: "Caminar 2km",
      date: DateTime.parse("2024-03-21")),
  Actividades(
      icon: Icons.directions_bike,
      title: "Bicicleta",
      description: "Bicicleta 10km",
      date: DateTime.parse("2024-03-21")),
  Actividades(
      icon: Icons.directions_run,
      title: "Correr",
      description: "Correr 5km",
      date: DateTime.parse("2024-03-21")),
  Actividades(
      icon: Icons.directions_run,
      title: "Correr",
      description: "Correr 5km",
      date: DateTime.parse("2024-03-22")),
];
