import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart'; // Necesitas este paquete para renderizar HTML

class Anuncio extends StatelessWidget {
  final String htmlData;

  const Anuncio({Key? key, required this.htmlData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Html(
        data: htmlData,
        // Aquí puedes añadir estilos adicionales si necesitas
        style: {
          "body": Style(
            backgroundColor: Colors.white,
            color: Colors.black,
          ),
          // Añade más estilos para diferentes etiquetas si lo requieres
        },
      ),
    );
  }
}
