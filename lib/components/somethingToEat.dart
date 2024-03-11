import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/comidasDelDia_model.dart';
import 'package:fitness/pages/mainMeal.dart';
import 'lista_componente.dart';

class RecetasComponente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ComidasDelDiaModel> comidas = PopularDietsRepository.getComidas();

    return ListaComponente<ComidasDelDiaModel>(
      titulo: 'Encuetra algo para comer',
      elementos: comidas,
      altura: 200,
      itemBuilder: (context, comidas) => Container(
        width: 200,
        decoration: BoxDecoration(
          color: comidas.color.withOpacity(0.3),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(100),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(comidas.iconPath),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 8.0),
                  child: Text(comidas.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(comidas.level,
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xff7B6F72))),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 8.0),
                  child: Container(
                    width: 100,
                    height: 35,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainMeal()),
                        );
                        print('go to ${comidas.name} page');
                      },
                      child: const Text(
                        'Ver recetas',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
