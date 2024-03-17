import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitness/services/notification.dart';
import 'package:fitness/components/water/semicirculoProgress.dart';

class Water extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Half Circle Progress Bar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HalfCircleProgressBar(
                backgroundColor: Colors.grey,
                valueColor: Colors.blue,
                value: 0.7,
                strokeWidth: 5,
                child: SvgPicture.asset(
                  'assets/icons/bebeAgua.svg',
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  mostrarNotification();
                },
                child: Text('Mostrar notificación'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initNotification();
  runApp(Water());
}
