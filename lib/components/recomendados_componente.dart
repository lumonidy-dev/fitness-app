import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/recomendados_model.dart';
import './lista_componente.dart';

class RecomendadosComponente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<RecomendadosModel> recomendados = RecomendadosRepository.getRecomendados();

    return ListaComponente<RecomendadosModel>(
      titulo: 'Populares',
      elementos: recomendados,
      altura: 300,
      isVertical: true,
      itemBuilder: (context, recomendado) {
        return Container(
          height: 100,
          decoration: BoxDecoration(
            color: recomendado.boxIsSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            boxShadow: recomendado.boxIsSelected
                ? [
                    BoxShadow(
                      color: const Color(0xff1D1617).withOpacity(0.07),
                      blurRadius: 40,
                      spreadRadius: 0.0,
                      offset: const Offset(0, 10),
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                recomendado.iconPath,
                height: 60,
                width: 60,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recomendado.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${recomendado.level} | ${recomendado.duration} | ${recomendado.calorie}',
                    style: const TextStyle(
                      color: Color(0xff7B6F72),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  print("go to ${recomendado.name} page");
                },
                child: SvgPicture.asset(
                  'assets/icons/button.svg',
                  height: 30,
                  width: 30,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
