// categorias_model.dart

import 'package:flutter/material.dart';

class CategoriasModel {
  final String nombre;
  final String iconPath;
  final Color boxColor;

  CategoriasModel({
    required this.nombre,
    required this.iconPath,
    required this.boxColor,
  });
}

class CategoriasRepository {
  static List<CategoriasModel> getCategorias() {
    // Utiliza datos simulados del mockup
    return _getMockup();
  }

  static Future<List<CategoriasModel>> getCategoriasFromServer() async {
    // Utiliza datos reales del servidor
    return _getData();
  }

  // Método para obtener los datos simulados del mockup
  static List<CategoriasModel> _getMockup() {
    return [
      CategoriasModel(
        nombre: 'Ensaladas',
        iconPath: 'assets/icons/plate.svg',
        boxColor: const Color(0xff9DCEFF),
      ),
      CategoriasModel(
        nombre: 'Pasteles',
        iconPath: 'assets/icons/pancakes.svg',
        boxColor: const Color(0xffEEA4CE),
      ),
      CategoriasModel(
        nombre: 'Pie',
        iconPath: 'assets/icons/pie.svg',
        boxColor: const Color(0xff9DCEFF),
      ),
      CategoriasModel(
        nombre: 'Jugos',
        iconPath: 'assets/icons/orange-snacks.svg',
        boxColor: const Color(0xffEEA4CE),
      ),
    ];
  }

  // Método para obtener los datos reales del servidor
  static Future<List<CategoriasModel>> _getData() async {
    // Aquí se realizaría la lógica para obtener las categorías del servidor real
    // Puedes utilizar paquetes como http para realizar las solicitudes HTTP
    // y parsear la respuesta en formato JSON
    // Por ahora, simplemente retornamos una lista vacía para este ejemplo
    await Future.delayed(
        Duration(seconds: 2)); // Simulación de tiempo de espera
    return [];
  }
}
