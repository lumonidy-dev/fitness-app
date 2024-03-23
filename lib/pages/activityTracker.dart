import 'package:fitness/components/slider/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:fitness/components/histogramas/home_histogramas.dart';


class ActivityTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Activity Tracker'),
        ),
        body: ListView(
          children: const [
            HomeHistogramas(),
            SizedBox(height: 10),
            HomeSlider(),
            SizedBox(height: 20),
          ],
        )
);
  }
}
