import 'dart:async';
import 'package:flutter/material.dart';

class ComidasDelDiaModel {
  final String name;
  final String iconPath;
  final String level;
  final Color color;

  ComidasDelDiaModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.color,
  });
}

class PopularDietsRepository {
  static List<ComidasDelDiaModel> getComidas() {
    // Utiliza datos simulados del mockup
    return _getMockup();
  }

  static Future<List<ComidasDelDiaModel>> getComidasFromServer() async {
    // Utiliza datos simulados del servidor
    return await _getData();
  }

  // Método para obtener los datos simulados del mockup
  static List<ComidasDelDiaModel> _getMockup() {
    return [
      ComidasDelDiaModel(
        name: 'Desayuno',
        iconPath: 'assets/icons/Vector.svg',
        level: '+50 Recetas',
        color: const Color(0xff9DCEFF),
      ),
      ComidasDelDiaModel(
        name: 'Almuerzo',
        iconPath: 'assets/icons/canai-bread.svg',
        level: '+50 Recetas',
        color: const Color(0xffC58BF2),
      ),
      ComidasDelDiaModel(
        name: 'Cena',
        iconPath: 'assets/icons/canai-bread.svg',
        level: '+50 Recetas',
        color: const Color(0xffC58BF2),
      ),
      ComidasDelDiaModel(
        name: 'Snack',
        iconPath: 'assets/icons/canai-bread.svg',
        level: '+50 Recetas',
        color: const Color(0xffC58BF2),
      ),
    ];
  }

  // Método para simular la obtención de datos desde el servidor
  static Future<List<ComidasDelDiaModel>> _getData() async {
    // Aquí podrías realizar una solicitud HTTP real al servidor
    // y parsear la respuesta en formato JSON
    // Por ahora, simplemente retornamos los datos simulados del mockup
    await Future.delayed(
        Duration(seconds: 2)); // Simulación de tiempo de espera
    return [];
  }
}
