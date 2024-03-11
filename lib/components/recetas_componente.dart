import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/popular_diets_model.dart';
import 'lista_componente.dart';

class RecetasComponente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<PopularDietsModel> recetas = PopularDietsRepository.getPopularDiets();

    return ListaComponente<PopularDietsModel>(
      titulo: 'Recetas populares',
      elementos: recetas,
      altura: 250,
      itemBuilder: (context, receta) => Container(
        width: 210,
        decoration: BoxDecoration(
          color: receta.color.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(receta.iconPath),
            Text(
              receta.name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              '${receta.level} | ${receta.duration} | ${receta.calorie}',
              style: const TextStyle(
                color: Color(0xff7B6F72),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            GestureDetector(
              onTap: () {
                print("go to ${receta.name} page");
              },
              child: Container(
                height: 45,
                width: 130,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff9DCEFF),
                      Color(0xff92A3FD),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
                    'ver',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
