class PesosModelSemanal {
  final String data;
  final double peso;

  PesosModelSemanal({required this.data, required this.peso});  
}

class PesosModelMensual {
  final String mes;
  final double peso;

  PesosModelMensual({required this.mes, required this.peso});  
}

class PesosRepository{
  static List<PesosModelSemanal> getPesos(){
    return _getMockup();
  }

  static List<PesosModelMensual> getPesosMensuales(){
    return _getMockupMensual();
  }

  static List<PesosModelSemanal> _getMockup(){
    return [
      PesosModelSemanal(data: 'Lunes', peso: 70.6),
      PesosModelSemanal(data: 'Martes', peso: 81.3),
      PesosModelSemanal(data: 'Miercoles', peso: 72.4),
      PesosModelSemanal(data: 'Jueves', peso: 73.1),
      PesosModelSemanal(data: 'Viernes', peso: 74.7),
      PesosModelSemanal(data: 'Sabado', peso: 85.6),
      PesosModelSemanal(data: 'Domingo', peso: 86.9),
    ];
  }

  static List<PesosModelMensual> _getMockupMensual(){
    return [
      PesosModelMensual(mes: 'Enero', peso: 70.6),
      PesosModelMensual(mes: 'Febrero', peso: 81.3),
      PesosModelMensual(mes: 'Marzo', peso: 72.4),
      PesosModelMensual(mes: 'Abril', peso: 73.1),
      PesosModelMensual(mes: 'Mayo', peso: 74.7),
      PesosModelMensual(mes: 'Junio', peso: 85.6),
      PesosModelMensual(mes: 'Julio', peso: 86.9),
      PesosModelMensual(mes: 'Agosto', peso: 70.6),
      PesosModelMensual(mes: 'Septiembre', peso: 81.3),
      PesosModelMensual(mes: 'Octubre', peso: 72.4),
      PesosModelMensual(mes: 'Noviembre', peso: 73.1),
      PesosModelMensual(mes: 'Diciembre', peso: 74.7),
    ];
  }


  // static Future<List<PesosModel>> getPesosFromServer() async {
  //   return _getData();
  // }
  //  // Método para obtener los datos reales del servidor
  // static Future<List<PesosModel>> _getData() async {
  //   // Aquí se realizaría la lógica para obtener las categorías del servidor real
  //   // Puedes utilizar paquetes como http para realizar las solicitudes HTTP
  //   // y parsear la respuesta en formato JSON
  //   // Por ahora, simplemente retornamos una lista vacía para este ejemplo
  //   await Future.delayed(Duration(seconds: 2)); // Simulación de tiempo de espera
  //   return [];
  // }5
}