import 'dart:async';

class RecomendadosModel {
  final String name;
  final String iconPath;
  final String level;
  final String duration;
  final String calorie;
  final bool boxIsSelected;

  RecomendadosModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected,
  });
}

class RecomendadosRepository {
  static List<RecomendadosModel> getRecomendados() {
    // Utiliza datos simulados del mockup
    return _getMockup();
  }

  static Future<List<RecomendadosModel>> getRecomendadosFromServer() async {
    // Utiliza datos simulados del servidor
    return await _getData();
  }

  // Método para obtener los datos simulados del mockup
  static List<RecomendadosModel> _getMockup() {
    return [
      RecomendadosModel(
        name: 'Blueberry Pancake',
        iconPath: 'assets/icons/blueberry-pancake.svg',
        level: 'Medium',
        duration: '30mins',
        calorie: '230kCal',
        boxIsSelected: true,
      ),
      RecomendadosModel(
        name: 'Salmon Nigiri',
        iconPath: 'assets/icons/salmon-nigiri.svg',
        level: 'Easy',
        duration: '20mins',
        calorie: '120kCal',
        boxIsSelected: false,
      ),
    ];
  }

  // Método para simular la obtención de datos desde el servidor
  static Future<List<RecomendadosModel>> _getData() async {
    // Aquí podrías realizar una solicitud HTTP real al servidor
    // y parsear la respuesta en formato JSON
    // Por ahora, simplemente retornamos los datos simulados del mockup
    await Future.delayed(Duration(seconds: 2)); // Simulación de tiempo de espera
    return [];
  }
}