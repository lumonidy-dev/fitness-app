import 'package:flutter/material.dart';

class ImcBox extends StatelessWidget {
  const ImcBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Moisés Leiva', // Nombre del usuario
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8), // Espacio entre elementos

                Text(
                  'Estado IMC: Obeso', // Estado IMC del usuario
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red, // Color de ejemplo
                  ),
                ),
                SizedBox(height: 8),

                Text(
                  'Peso: 80 kg', // Peso del usuario
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),

                Text(
                  'Puntuación IMC: 30', // Puntuación IMC del usuario
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),

                Row(
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt, // Emoji feliz
                      color: Colors.green, // Color de ejemplo
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Saludable', // Texto descriptivo de la salud
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green, // Color de ejemplo
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
