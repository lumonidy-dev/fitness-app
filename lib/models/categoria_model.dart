import 'package:flutter/material.dart';

class CategoriasModel{
  String nombre;
  String iconPath;
  Color boxColor;

  CategoriasModel({
    required this.nombre,
    required this.iconPath,
    required this.boxColor
  });

   static List<CategoriasModel>  getCategorias() {
    List<CategoriasModel> Categorias = [];

    Categorias.add(CategoriasModel(
      nombre: 'Ensaladas',
      iconPath: 'assets/icons/plate.svg',
      boxColor: const Color(0xff9DCEFF)
    ));

    Categorias.add(CategoriasModel(
      nombre: 'Pasteles',
      iconPath: 'assets/icons/pancakes.svg',
      boxColor: const Color(0xffEEA4CE)
    ));

    Categorias.add(CategoriasModel(
      nombre: 'Pie',
      iconPath: 'assets/icons/pie.svg',
      boxColor: const Color(0xff9DCEFF)
    ));

    Categorias.add(CategoriasModel(
      nombre: 'Jugos',
      iconPath: 'assets/icons/orange-snacks.svg',
      boxColor: const Color(0xffEEA4CE)
    ));
    return Categorias;
  }
}