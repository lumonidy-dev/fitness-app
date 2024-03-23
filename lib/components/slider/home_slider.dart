import 'package:flutter/material.dart';
import 'package:fitness/components/slider/utils_slider/date_utils.dart'
    as DateUtils;
import 'package:fitness/components/slider/actividades_view.dart';
import 'package:fitness/components/slider/horizontalview.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  //variables
  double width = 0;
  double height = 0;
  DateTime dateTimeActual = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  //funcion de devolucion de llamada para el cambio de fecha
  void onDaySelected(DateTime selectDay) {
    setState(() {
      _selectedDay = selectDay;
    });
  }

  Widget Calendario() {
    // Contenedor principal
    return Container(
      height: height * 0.65, // altura del contenedor 65% de la pantalla
      width: width, // ancho del contenedor
      decoration: const BoxDecoration(
       color: Colors.white,
        borderRadius:  BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        boxShadow:  [
          BoxShadow(
              blurRadius: 4,
              color: Colors.black12,
              offset: Offset(4, 4),
              spreadRadius: 2)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          tituloView(),
          horizontalview(width: width, selectDay: _selectedDay, onDaySelected: onDaySelected),
          actividadesView(height * 0.27,_selectedDay)
        ],
      ),
    );
  }

  Widget tituloView() {
    // Titulo del mes actual
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Text(
        DateUtils.DateUtils.months[dateTimeActual.month - 1] +
            " " +
            dateTimeActual.year.toString(),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xffADA4A5)
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Calendario();
    
  }
}
