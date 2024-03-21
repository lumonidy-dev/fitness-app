import 'package:flutter/material.dart';

class IMCData {
  final String nombre;
  final double imc;
  final double peso;
  final double altura;
  final String status;

  IMCData({
    required this.nombre,
    required this.imc,
    required this.peso,
    required this.altura,
    required this.status,
  });

  static IMCData? fromJson(Map<String, dynamic> json, BuildContext context) {
    if (json['nombre'] != null &&
        json['imc'] != null &&
        json['peso'] != null &&
        json['altura'] != null &&
        json['status'] != null) {
      return IMCData(
        nombre: json['nombre'],
        imc: json['imc'],
        peso: json['peso'],
        altura: json['altura'],
        status: json['status'],
      );
    } else {
      _mostrarAlerta(context);
      return null;
    }
  }

  static void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error en los datos'),
          content: const Text('Los datos recibidos son inválidos o faltan.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static String getIMCStatus(double imc) {
    if (imc < 18.5) {
      return 'Bajo peso';
    } else if (imc >= 18.5 && imc < 24.9) {
      return 'Peso normal';
    } else if (imc >= 24.9 && imc < 29.9) {
      return 'Sobrepeso';
    } else {
      return 'Obeso';
    }
  }

  static IMCData getTestData() {
    // Datos de prueba ficticios
    const double imc = 32.0;
    return IMCData(
      nombre: 'John Doe',
      imc: imc,
      peso: 70.0,
      altura: 1.75,
      status: getIMCStatus(imc),
    );
  }
}
