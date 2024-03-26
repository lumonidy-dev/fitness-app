import 'package:fitness/components/water/porcentaje.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitness/services/notification.dart';
import 'package:fitness/components/water/semicirculoProgress.dart';
import 'package:fitness/components/water/iconBar.dart';

class Water extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Half Circle Progress Bar'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Contenedor de los iconos
                Positioned(
                  bottom:
                      250, // Ajusta la posición vertical según sea necesario
                  child: IconBar(
                    startIcon: SvgPicture.asset(
                      'assets/icons/startIcon.svg',
                      width: 32,
                      height: 32,
                    ),
                    endIcon: SvgPicture.asset(
                      'assets/icons/endIcon.svg',
                      width: 32,
                      height: 32,
                    ),
                  ),
                ),
                // Contenedor del medio círculo y la imagen bebeAgua
                HalfCircleProgressBar(
                  backgroundColor: Colors.grey,
                  valueColor: Colors.blue,
                  value: 0.7,
                  strokeWidth: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 175, 212, 229),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.5), // Color de la sombra
                            spreadRadius: 5, // Extensión de la sombra
                            blurRadius: 7, // Desenfoque de la sombra
                            offset: Offset(0, 3), // Desplazamiento de la sombra
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/bebeAgua.svg',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                ),
                Positioned(bottom: 380, child: Porcentaje()),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            mostrarNotification();
          },
          child: Icon(Icons.notifications),
        ),
      ),
    );
  }
}



// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initNotification();
//   runApp(Water());
// }
