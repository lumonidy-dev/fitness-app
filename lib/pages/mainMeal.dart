import 'package:flutter/material.dart';
import 'package:fitness/components/appbar_componente.dart';
import 'package:fitness/components/categorias_componente.dart';
import 'package:fitness/components/recetas_componente.dart';
import 'package:fitness/components/recomendados_componente.dart';
import 'package:fitness/components/buscador_componente.dart';


class MainMeal extends StatelessWidget {
  MainMeal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarComponente(
          title: 'Desayunos 1.1.1',
          onBackButtonPressed: () {
            Navigator.pop(context);
            print('Botón de atrás presionadooo');
          },
          onMenuButtonPressed: () {
            print('Botón de menú presionado');
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          BuscadorComponente(),
          const SizedBox(height: 20),
          CategoriasComponente(),
          const SizedBox(height: 40),
          RecetasComponente(),
          const SizedBox(height: 20),
          RecomendadosComponente(),
        ],
      ),
    );
  }
}
