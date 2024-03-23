import 'package:fitness/components/histogramas/bar_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyBarGraph extends StatelessWidget {
  final List pesosDiarios;
  final List pesosMensuales;
  final bool isWeeklyView;
  final bool isPesoKg;
  const MyBarGraph(
      {Key? key,
      required this.pesosDiarios,
      required this.isWeeklyView,
      required this.pesosMensuales,
      required this.isPesoKg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    //inicio de la vista mensual
    barDataMensual myBarDataMensual = barDataMensual(
      pesosEnero: pesosMensuales[0].peso,
      pesosFebrero: pesosMensuales[1].peso,
      pesosMarzo: pesosMensuales[2].peso,
      pesosAbril: pesosMensuales[3].peso,
      pesosMayo: pesosMensuales[4].peso,
      pesosJunio: pesosMensuales[5].peso,
      pesosJulio: pesosMensuales[6].peso,
      pesosAgosto: pesosMensuales[7].peso,
      pesosSeptiembre: pesosMensuales[8].peso,
      pesosOctubre: pesosMensuales[9].peso,
      pesosNoviembre: pesosMensuales[10].peso,
      pesosDiciembre: pesosMensuales[11].peso,
    );
    // inicializa la información de la lista de pesos
    myBarDataMensual.initBarDataMensual();

    // inicializa a lista de pesos
    BarData myBarDataSemanal = BarData(
      pesoLunes: pesosDiarios[0].peso,
      pesoMartes: pesosDiarios[1].peso,
      pesoMiercoles: pesosDiarios[2].peso,
      pesoJueves: pesosDiarios[3].peso,
      pesoViernes: pesosDiarios[4].peso,
      pesoSabado: pesosDiarios[5].peso,
      pesoDomingo: pesosDiarios[6].peso,
    );

    // inicializa la información de la lista de pesos
    myBarDataSemanal.initBarData();

    return BarChart(BarChartData(
      maxY:
          isPesoKg ? 100 : 250, //este maximo lo puedos ajustar dependiendo del peso maximo que del usuario
      minY: 0,
      gridData: const FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: false,
        horizontalInterval: 20,
      ),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        show: true,
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget:
                    isWeeklyView ? getBottomTitlesWeekly : getBottomTitles)),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return getRightTitle(value, meta, isPesoKg);
              },
              reservedSize: 50),
        ),
      ),
      barGroups: isWeeklyView
          ? myBarDataSemanal.barData
              .map((data) => BarChartGroupData(x: data.x, barRods: [
                    BarChartRodData( //datos de la barra semanal
                      toY: isPesoKg ? data.y : data.y * 2.20462,
                      color: Colors.blue[600],
                      width: 12,
                      borderRadius: BorderRadius.circular(5),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: 100,
                        color: Colors.grey[300],
                      ),
                    )
                  ]))
              .toList()
          : myBarDataMensual.barData
              .map((data) => BarChartGroupData(x: data.x, barRods: [
                    BarChartRodData( //datos de la barra mensual
                      toY: isPesoKg ? data.y : data.y * 2.20462,
                      color: Colors.blue[600],
                      width: 12,
                      borderRadius: BorderRadius.circular(5),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: 100,
                        color: Colors.grey[300],
                      ),
                    )
                  ]))
              .toList(),
    ));
  }
}

Widget getRightTitle(double value, TitleMeta meta, bool isPesoKg) {
  const style = TextStyle(
    color: Colors.grey,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  String titleText;
  if (isPesoKg) {
    titleText = '${value.toInt()} kg';
  } else {
    titleText = '${(value).toInt()} lb';
  }

  return SideTitleWidget(
    axisSide: AxisSide.left,
    child: FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(titleText, style: style),
    ),
  );
}

Widget getBottomTitlesWeekly(double value, TitleMeta meta) {
  const style = TextStyle(
      color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal);

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('L', style: style);
      break;
    case 1:
      text = const Text('M', style: style);
      break;
    case 2:
      text = const Text('Mi', style: style);
      break;
    case 3:
      text = const Text('J', style: style);
      break;
    case 4:
      text = const Text('V', style: style);
      break;
    case 5:
      text = const Text('S', style: style);
      break;
    case 6:
      text = const Text('D', style: style);
      break;
    default:
      text = const Text('Error', style: style);
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
      color: Colors.grey, fontSize: 10, fontWeight: FontWeight.normal);

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('En', style: style);
      break;
    case 1:
      text = const Text('Feb', style: style);
      break;
    case 2:
      text = const Text('Mar', style: style);
      break;
    case 3:
      text = const Text('Abr', style: style);
      break;
    case 4:
      text = const Text('May', style: style);
      break;
    case 5:
      text = const Text('Jun', style: style);
      break;
    case 6:
      text = const Text('Jul', style: style);
      break;
    case 7:
      text = const Text('Ag', style: style);
      break;
    case 8:
      text = const Text('Sep', style: style);
      break;
    case 9:
      text = const Text('Oct', style: style);
      break;
    case 10:
      text = const Text('Nov', style: style);
      break;
    case 11:
      text = const Text('Dic', style: style);
      break;

    default:
      text = const Text('Error', style: style);
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}
