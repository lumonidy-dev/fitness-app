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
