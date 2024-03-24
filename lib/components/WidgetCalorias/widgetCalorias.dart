import 'package:flutter/material.dart';

class WidgetCalorias extends StatelessWidget {
  final double caloriasMeta;
  final double caloriasConsumidas;

  const WidgetCalorias({
    required this.caloriasMeta,
    required this.caloriasConsumidas,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            color: const Color(0xff1D1617).withOpacity(0.07),
            blurRadius: 40,
          ),
        ],
      ),
      width: 200,
      height: 200,
      child: Column(children: [
        TextoCalorias(
          caloriasConsumidas: caloriasConsumidas,
        ),
        ProgressBar(
            caloriasConsumidas: caloriasConsumidas, caloriasMeta: caloriasMeta)
      ]),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.caloriasConsumidas,
    required this.caloriasMeta,
  });

  final double caloriasConsumidas;
  final double caloriasMeta;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                value: caloriasConsumidas / caloriasMeta,
                strokeWidth: 10,
                backgroundColor: const Color(0xffF3F3F3),
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Color(0xff92A3FD)),
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                       Color(0xff9DCEFF),
                      Color(0xff92A3FD)
                     
                    ], // Colores del degradado
                    begin: Alignment.topLeft, // Inicio del degradado
                    end: Alignment.bottomRight, // Fin del degradado
                  )),
              child: SizedBox(
                height: 10,
                width: 10,
                child: Center(
                  child: Text(
                    '${(caloriasMeta - caloriasConsumidas).toStringAsFixed(0)} Kcal\nRestantes', // Muestra las calorías restantes
                    style: const TextStyle(
                      fontSize: 9,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class TextoCalorias extends StatelessWidget {
  final double caloriasConsumidas;

  const TextoCalorias({
    required this.caloriasConsumidas,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20),
      child: Container(
        width: 100,
        height: 52,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Calorias',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    Color(0xff92A3FD),
                    Color(0xff9DCEFF)
                  ], // Colores del degradado
                  begin: Alignment.centerRight, // Inicio del degradado
                  end: Alignment.centerLeft, // Fin del degradado
                ).createShader(bounds);
              },
              child: Text(
                caloriasConsumidas.toInt().toString() + " Kcal",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors
                      .white, // Color del texto (será modulado por el degradado)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
