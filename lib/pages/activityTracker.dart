import 'package:flutter/material.dart';
import 'package:fitness/components/bottomNavBar_componente.dart';

class ActivityTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: Text(
            'Activity Tracker',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
);
  }
}
