import 'package:fitness/pages/mainMeal.dart';
import 'package:flutter/material.dart';
import 'package:fitness/components/appbar_componente.dart';
import 'package:fitness/components/nutricion_componente.dart';
import 'package:fitness/components/botonLargoSimple.dart';
import 'package:fitness/components/somethingToEat.dart';
import 'package:fitness/components/bottomNavBar_componente.dart';

class MealPlanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBarComponente(
            title: 'Meal Planner',
            onBackButtonPressed: () {
              print('Botón de atrás presionadooo');
            },
            onMenuButtonPressed: () {
              print('Botón de menú del meal planner presionado');
            },
          ),
        ),
        body: ListView(
          children: [
            NutricionComponente(),
            const SizedBox(height: 50),
            BotonLargoSimple(
                texto: 'Daily Meal Finder',
                onPressed: () {
                  print('go to Daily Meal Finder');
                }),
            const SizedBox(height: 20),
            RecetasComponente(),
            const SizedBox(height: 40),
          ],
        ),
);
  }
}
