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
          children: [
            HomeHistogramas(),
          ],
        )
);
  }
}
