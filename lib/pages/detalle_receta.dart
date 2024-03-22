import 'package:flutter/material.dart';
import '../models/popular_diets_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/data_icons.dart';
import 'package:readmore/readmore.dart';

class DetalleReceta extends StatefulWidget {
  final PopularDietsModel receta;
  final int maxChars = 150; // Define el número máximo de caracteres a mostrar

  const DetalleReceta({required this.receta});

  @override
  _DetalleRecetaState createState() => _DetalleRecetaState();
}

class _DetalleRecetaState extends State<DetalleReceta> {
  bool isExpanded = false;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    String description = widget.receta.description.length > widget.maxChars
        ? '${widget.receta.description.substring(0, widget.maxChars)}...' // Si la descripción excede el límite, muestra solo los primeros maxChars caracteres
        : widget
            .receta.description; // De lo contrario, muestra toda la descripción

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icono SVG de Honey Pancake
          AspectRatio(
            aspectRatio: 6 / 5, // Define el aspecto deseado (ancho / alto)
            child: SizedBox(
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF92A3FD),
                      Color(0xFF9DCEFF),
                    ],
                    stops: [0.0, 1.2445],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    transform:
                        GradientRotation(200.42 * (3.141592653589793 / 180)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SvgPicture.asset(
                    widget.receta.iconPath,
                    fit: BoxFit
                        .contain, // Ajusta la imagen dentro del contenedor
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25), // Espacio entre el icono y los datos

          // Envuelve esta parte del cuerpo con Padding para aplicar el relleno solo aquí
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.receta.name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      'By: ',
                      style: TextStyle(fontSize: 15),
                    ),
                    RichText(
                      text: TextSpan(
                        text: widget.receta.author,
                        style: TextStyle(
                          color: Color.fromARGB(255, 139, 190,
                              231), // Color celeste para el autor
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height:15), // Espacio entre el autor y los datos
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nutritional Information',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height:5),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildDataContainer(
                              CustomIcons.calorie(), widget.receta.calorie),
                          _buildDataContainer(
                              CustomIcons.fats(), widget.receta.fats),
                          _buildDataContainer(
                              CustomIcons.proteins(), widget.receta.proteins),
                          _buildDataContainer(CustomIcons.carbohydrates(),
                              widget.receta.carbohydrates),
                          _buildDataContainer(
                              CustomIcons.vitamines(), widget.receta.vitamines),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5), // Espacio entre el título y la descripción
                ReadMoreText(
                  widget.receta.description,
                  trimLines: 4,
                  preDataTextStyle: TextStyle(fontWeight: FontWeight.w500),
                  style: TextStyle(color: Colors.black),
                  colorClickableText: Color.fromARGB(255, 139, 190, 231),
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...Show more',
                  trimExpandedText: ' show less',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataContainer(Widget icon, String value) {
    return Container(
      margin: EdgeInsets.only(right: 10), // Espacio entre los contenedores
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset:
                Offset(0, 1), // Cambia la posición de la sombra si es necesario
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
