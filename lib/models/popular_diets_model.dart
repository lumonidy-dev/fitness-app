import 'dart:async';
import 'package:flutter/material.dart';

class PopularDietsModel {
  final String name;
  final String iconPath;
  final String level;
  final String duration;
  final String calorie;
  final String fats;
  final String proteins;
  final String carbohydrates;
  final String vitamines;
  final bool boxIsSelected;
  final Color color;

  PopularDietsModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.fats,
    required this.proteins,
    required this.carbohydrates,
    required this.vitamines,
    required this.boxIsSelected,
    required this.color,
  });
}

class PopularDietsRepository {
  static List<PopularDietsModel> getPopularDiets() {
    // Utiliza datos simulados del mockup
    return _getMockup();
  }

  static Future<List<PopularDietsModel>> getPopularDietsFromServer() async {
    // Utiliza datos simulados del servidor
    return await _getData();
  }

  // Método para obtener los datos simulados del mockup
  static List<PopularDietsModel> _getMockup() {
    return [
      PopularDietsModel(
        name: 'Honey Pancake',
        iconPath: 'assets/icons/honey-pancakes.svg',
        level: 'Facil',
        duration: '30mins',
        calorie: '180kCal',
        fats: '30g fats',
        proteins: '20g proteins',
        carbohydrates: '40g carbohydrates',
        vitamines: 'Vitamin A, B, C, D, K',
        boxIsSelected: true,
        color: const Color(0xff9DCEFF),
      ),
      PopularDietsModel(
        name: 'Canai Bread',
        iconPath: 'assets/icons/canai-bread.svg',
        level: 'Easy',
        duration: '20mins',
        calorie: '230kCal',
        fats: '20g fats',
        proteins: '25g proteins',
        carbohydrates: '35g carbohydrates',
        vitamines: 'Vitamin A, B, C',
        boxIsSelected: false,
        color: const Color(0xffC58BF2),
      ),
    ];
  }

  // Método para simular la obtención de datos desde el servidor
  static Future<List<PopularDietsModel>> _getData() async {
    // Aquí podrías realizar una solicitud HTTP real al servidor
    // y parsear la respuesta en formato JSON
    // Por ahora, simplemente retornamos los datos simulados del mockup
    await Future.delayed(Duration(seconds: 2)); // Simulación de tiempo de espera
    return [];
  }
}
