import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class Myboton extends StatelessWidget {
  final bool isWeeklyView;
  final bool isPesoKg;
  final Function(bool) changeView;
  final Function(bool) changeUnit;

  const Myboton(
      {required this.isWeeklyView,
      required this.changeView,
      required this.isPesoKg,
      required this.changeUnit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPopover(
        context: context,
        bodyBuilder: (context) => MenuItems(
          isWeeklyView: isWeeklyView,
          changeView: changeView,
          isPesoKg: isPesoKg,
          changeUnit: (value) {
            changeUnit(value);
          },
        ),
        onPop: () => print('Popover was popped!'),
        direction: PopoverDirection.bottom,
        width: 200,
        height: 150,
        backgroundColor: Colors.white,
      ),
      child: const Icon(Icons.more_vert, color: Colors.grey),
    );
  }
}

class MenuItems extends StatelessWidget {
  final bool isWeeklyView;
  final bool isPesoKg;
  final Function(bool) changeView;
  final Function(bool) changeUnit;

  const MenuItems({
    required this.isWeeklyView,
    required this.isPesoKg,
    required this.changeView,
    required this.changeUnit,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ToggleButtons(
            isSelected: [isWeeklyView, !isWeeklyView],
            onPressed: (index) {
              changeView(index == 0);
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(10),
            selectedColor: Colors.blueGrey,
            selectedBorderColor: Colors.blueGrey,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Semanal',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Mensual',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Espacio entre los dos ToggleButtons
          ToggleButtons(
            isSelected: [isPesoKg, !isPesoKg],
            onPressed: (index) {
              changeUnit(index == 0);
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(10),
            selectedColor: Colors.blueGrey,
            selectedBorderColor: Colors.blueGrey,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Kg',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Lb',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
