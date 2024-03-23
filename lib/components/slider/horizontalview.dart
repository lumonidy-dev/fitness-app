import 'package:flutter/material.dart';
import 'package:fitness/components/slider/utils_slider/date_utils.dart'
    as DateUtils;


class horizontalview extends StatefulWidget {
  final double width;
  final DateTime? selectDay;
  final Function(DateTime) onDaySelected;

  const horizontalview(
      {super.key,
      required this.width,
      this.selectDay,
      required this.onDaySelected});

  @override
  State<horizontalview> createState() => _horizontalviewState();
}

class _horizontalviewState extends State<horizontalview> {
//variables

  double height = 0;
  late ScrollController scrollController;
  List<DateTime> listaMesActual = List.empty();
  DateTime dateTimeActual = DateTime.now();
  List<String> actividadesRealizadas = <String>[];

  @override
  void initState() {
    //
    listaMesActual = DateUtils.DateUtils.daysInMonth(
        dateTimeActual); //obtener dias del mes actual
    listaMesActual.sort((a, b) => a.day.compareTo(b.day)); //ordenar lista
    listaMesActual = listaMesActual.toSet().toList(); //eliminar duplicados
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * dateTimeActual.day);
    super.initState();
  }

  Widget horizontalview(
      double width, DateTime? selectDay, Function(DateTime) onDaySelected) {
    // ListView.builder de los dias del mes actual
    return Container(
      width: width,
      height: 160,
      child: ListView.builder(
        itemCount: listaMesActual.length,
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return capsuleView(index, selectDay, onDaySelected);
        },
      ),
    );
  }

  Widget capsuleView(
      int index, DateTime? selectDay, Function(DateTime) onDaySelected) {
    // Container de Cada dia del mes actual
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            dateTimeActual = listaMesActual[index];
            // print("Fecha seleccionada: " +
            //     dateTimeActual.toString().substring(0, 10));
            onDaySelected(dateTimeActual);
            
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            width: 80,
            height: 140,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: (listaMesActual[index].day != dateTimeActual.day)
                        ? [
                            Colors.white.withOpacity(0.8),
                           
                            Colors.white.withOpacity(0.6)
                          ]
                        : [
                            Color(0xff92A3FD),
                            
                            Color(0xff9DCEFF)
                          ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    color: Colors.black12,
                    spreadRadius: 2,
                  ),
                ]),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(listaMesActual[index].day.toString(),
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: (listaMesActual[index].day != dateTimeActual.day)
                          ? Color(0xffADA4A5)
                          : Colors.white,
                    )),
                Text(
                    DateUtils
                        .DateUtils.weekdays[listaMesActual[index].weekday - 1],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: listaMesActual[index].day != dateTimeActual.day
                          ? Color(0xffADA4A5)
                          : Colors.white,
                    )),
              ],
            )),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          horizontalview(widget.width, widget.selectDay, widget.onDaySelected),
    );
  }
}
