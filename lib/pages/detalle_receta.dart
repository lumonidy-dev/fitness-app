import 'package:flutter/material.dart';
import '../models/popular_diets_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/data_icons.dart';

class DetalleReceta extends StatelessWidget {
  final PopularDietsModel receta;

  const DetalleReceta({required this.receta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receta.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icono SVG de Honey Pancake
            SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                receta.iconPath,
                height: 200, // Ajusta la altura según tu preferencia
              ),
            ),
            SizedBox(height: 40), // Espacio entre el icono y los datos

            // Contenedor con los datos de la receta
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildDataContainer(CustomIcons.calorie(), receta.calorie),
                  _buildDataContainer(CustomIcons.fats(), receta.fats),
                  _buildDataContainer(CustomIcons.proteins(), receta.proteins),
                  _buildDataContainer(CustomIcons.vitamins(), receta.carbohydrates),
                ],
              ),
            ),

            SizedBox(height: 20), // Espacio entre los datos y el resto de la información

            // Resto de la información
            Text(
              'Nivel: ${receta.level}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Duración: ${receta.duration}',
              style: TextStyle(fontSize: 18),
            ),
            // Aquí puedes agregar más detalles de la receta si lo deseas
          ],
        ),
      ),
    );
  }

  Widget _buildDataContainer(Widget icon, String value) {
    return Container(
      margin: EdgeInsets.only(right: 10), // Espacio entre los contenedores
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 1), // Cambia la posición de la sombra si es necesario
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(width: 4), // Espacio entre el icono y el texto
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
