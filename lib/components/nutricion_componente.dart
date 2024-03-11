import 'package:flutter/material.dart';
import 'package:fitness/components/radarChart.dart';

class NutricionComponente extends StatefulWidget {
  @override
  _NutricionComponenteState createState() => _NutricionComponenteState();
}

class _NutricionComponenteState extends State<NutricionComponente> {
  // Valores de ejemplo para los vértices
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Meal Nutritions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                child: Container(
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextButton(
                    // Alinea el texto al centro del Container
                    onPressed: () {
                      _showEditPopup(context);
                    },
                    child: const Text(
                      'Editar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 45),
        RadarChartWidget(
          data: const [
            2, //Energia
            8, //Proteinas
            4, //grasas
            2, //Carbohidratos
            7, //fibra
            10, //Vitaminas
            10, //Azcuares
            8 //Sodio
          ], // Datos de ejemplo para el gráfico (ajusta según sea necesario)
          maxValue:
              10, // Máximo valor en el gráfico (ajusta según sea necesario)
        ),
      ],
    );
  }

  void _showEditPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar'),
          content: Text('Aquí puedes editar tu nutrición'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
