import 'package:flutter/material.dart';
import 'package:fitness/components/WidgetCalorias/widgetCalorias.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Home',
        )),
      ),
      body: const Center( 
          child: WidgetCalorias(caloriasConsumidas: 660, caloriasMeta: 900,)),
    );
  }
}

