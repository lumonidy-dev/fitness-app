import 'package:flutter/material.dart';

class BotonLargoSimple extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final String textoBoton;

  const BotonLargoSimple({
    Key? key,
    required this.texto,
    required this.onPressed,
    this.textoBoton = 'ver',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 17),
          child: Container(
            width: 320,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xff9DCEFF).withOpacity(0.4),
            ),
            alignment: Alignment.center,
            child: Row(
              // Agrega un Row para alinear el texto y el Container adicional
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      texto, // Utiliza la variable texto aquí
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    // Container adicional de 30x30
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextButton(
                      onPressed: onPressed,
                      style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.zero, // Elimina el padding del botón
                      ),
                      child: Text(
                        textoBoton,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14, // Mismo tamaño que el texto principal
                          fontWeight: FontWeight
                              .normal, // Mismo peso que el texto principal
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
