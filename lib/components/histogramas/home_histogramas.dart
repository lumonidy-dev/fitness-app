import 'package:fitness/components/histogramas/bar_graph.dart';
import 'package:fitness/models/HistogramaPeso/graficoPeso_model.dart';
import 'package:flutter/material.dart';
import 'boton_histograma/boton_popover.dart';

class HomeHistogramas extends StatefulWidget {
  const HomeHistogramas({Key? key}) : super(key: key);
  @override
  State<HomeHistogramas> createState() => _HomeHistogramasState();
}

class _HomeHistogramasState extends State<HomeHistogramas> {
  bool _isWeeklyView =
      true; // Estado para controlar la vista seleccionada(por defecto semanal)
  bool _isPesoKg =
      true; // Estado para controlar la unidad de peso seleccionada (por defecto kg)

  // Lista de pesos diarios
  List<PesosModelSemanal> pesosSemanales = PesosRepository.getPesos();
  // Lista de pesos mensuales
  List<PesosModelMensual> pesosMensuales = PesosRepository.getPesosMensuales();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(
                  child: Text('Estadísticas de peso',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Myboton(
                    isPesoKg: _isPesoKg,
                    isWeeklyView: _isWeeklyView,
                    changeView: (value) {
                      setState(() {
                        _isWeeklyView = value;
                      });
                    },
                    changeUnit: (value) {
                      setState(() {
                        _isPesoKg = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 250,
            child: MyBarGraph(
              isPesoKg: _isPesoKg,
              pesosDiarios:
                  pesosSemanales, // arreglar que se envie solo un peso o dependeiendo de la vista
              isWeeklyView: _isWeeklyView,
              pesosMensuales: pesosMensuales,
            ),
          ),
        ],
      ),
    );
  }
}
