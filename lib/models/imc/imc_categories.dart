// imc_categories.dart

import 'package:flutter/material.dart';

class IMCCategory {
  final String name;
  final double min;
  final double max;

  IMCCategory({
    required this.name,
    required this.min,
    required this.max,
  });
}

List<IMCCategory> imcCategories = [
  IMCCategory(
      name: 'Delgadez muy severa', min: double.negativeInfinity, max: 16),
  IMCCategory(name: 'Delgadez severa', min: 16, max: 16.9),
  IMCCategory(name: 'Delgadez', min: 17, max: 18.4),
  IMCCategory(name: 'Peso normal', min: 18.5, max: 24.9),
  IMCCategory(name: 'Sobrepeso', min: 25, max: 29.9),
  IMCCategory(name: 'Obesidad grado I', min: 30, max: 34.9),
  IMCCategory(name: 'Obesidad grado II', min: 35, max: 39.9),
  IMCCategory(
      name: 'Obesidad grado III (mórbida)', min: 40, max: double.infinity),
];

List<IMCCategory> categoriesFromChart = [
  IMCCategory(name: 'Delgadez', min: 12, max: 18.4),
  IMCCategory(name: 'Normal', min: 18.5, max: 24.9),
  IMCCategory(name: 'Obesidad', min: 25, max: 39.9),
];

Color getCategoryColor(IMCCategory category) {
  switch (category.name) {
    case 'Delgadez':
      return Colors.blue;
    case 'Normal':
      return Colors.green;
    case 'Obesidad':
      return Colors.red;
    default:
      return Colors.grey;
  }
}

Color getCategoryTextColor(String name) {
  switch (name) {
    case 'Delgadez':
      return Colors.blue;
    case 'Normal':
      return Colors.green;
    case 'Obesidad':
      return Colors.red;
    default:
      return Colors.black;
  }
}

String getCategoryFromIMC(double imc) {
  for (var category in categoriesFromChart) {
    if (imc >= category.min && imc <= category.max) {
      return category.name;
    }
  }
  return 'No definido';
}

String getEmojiFromIMC(double imc) {
  if (imc < 18.5) {
    return '😢';
  } else if (imc >= 18.5 && imc <= 24.9) {
    return '😊';
  } else {
    return '😡';
  }
}
