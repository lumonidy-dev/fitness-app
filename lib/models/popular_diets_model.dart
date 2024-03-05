import 'dart:async';

class PopularDietsModel {
  final String name;
  final String iconPath;
  final String level;
  final String duration;
  final String calorie;
  final bool boxIsSelected;

  PopularDietsModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected,
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
        boxIsSelected: true,
      ),
      PopularDietsModel(
        name: 'Canai Bread',
        iconPath: 'assets/icons/canai-bread.svg',
        level: 'Easy',
        duration: '20mins',
        calorie: '230kCal',
        boxIsSelected: false,
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
