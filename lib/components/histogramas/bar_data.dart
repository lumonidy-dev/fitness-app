class IndividualBar {
  final int x;
  final double y;

  IndividualBar({
    required this.x,
    required this.y,
  });
}

class BarData {
  final double pesoLunes;
  final double pesoMartes;
  final double pesoMiercoles;
  final double pesoJueves;
  final double pesoViernes;
  final double pesoSabado;
  final double pesoDomingo;

  BarData({
    required this.pesoLunes,
    required this.pesoMartes,
    required this.pesoMiercoles,
    required this.pesoJueves,
    required this.pesoViernes,
    required this.pesoSabado,
    required this.pesoDomingo,

  });

  List<IndividualBar> barData = [];

  // inicializa la información de la lista de pesos
  void initBarData() {
    barData = [
      IndividualBar(x: 0, y: pesoLunes),
      IndividualBar(x: 1, y: pesoMartes),
      IndividualBar(x: 2, y: pesoMiercoles),
      IndividualBar(x: 3, y: pesoJueves),
      IndividualBar(x: 4, y: pesoViernes),
      IndividualBar(x: 5, y: pesoSabado),
      IndividualBar(x: 6, y: pesoDomingo),
    ];
  }
}

class barDataMensual {
  final double pesosEnero;
  final double pesosFebrero;
  final double pesosMarzo;
  final double pesosAbril;
  final double pesosMayo;
  final double pesosJunio;
  final double pesosJulio;
  final double pesosAgosto;
  final double pesosSeptiembre;
  final double pesosOctubre;
  final double pesosNoviembre;
  final double pesosDiciembre;

  barDataMensual({
    required this.pesosEnero,
    required this.pesosFebrero,
    required this.pesosMarzo,
    required this.pesosAbril,
    required this.pesosMayo,
    required this.pesosJunio,
    required this.pesosJulio,
    required this.pesosAgosto,
    required this.pesosSeptiembre,
    required this.pesosOctubre,
    required this.pesosNoviembre,
    required this.pesosDiciembre,
  });

  List<IndividualBar> barData = [];

  // inicializa la información de la lista de pesos
  void initBarDataMensual() {
    barData = [
      IndividualBar(x: 0, y: pesosEnero),
      IndividualBar(x: 1, y: pesosFebrero),
      IndividualBar(x: 2, y: pesosMarzo),
      IndividualBar(x: 3, y: pesosAbril),
      IndividualBar(x: 4, y: pesosMayo),
      IndividualBar(x: 5, y: pesosJunio),
      IndividualBar(x: 6, y: pesosJulio),
      IndividualBar(x: 7, y: pesosAgosto),
      IndividualBar(x: 8, y: pesosSeptiembre),
      IndividualBar(x: 9, y: pesosOctubre),
      IndividualBar(x: 10, y: pesosNoviembre),
      IndividualBar(x: 11, y: pesosDiciembre),
    ];
  }
}
