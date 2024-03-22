import 'package:flutter/material.dart';

class IMCData {
  double imc;

  final String nombre;
  final int edad;
  double peso;
  double altura;
  final int sexo;

  final String unidadAltura;
  final String unidadPeso;

  String status;

  IMCData({
    required this.imc,
    required this.nombre,
    required this.edad,
    required this.peso,
    required this.altura,
    required this.sexo,
    required this.unidadAltura,
    required this.unidadPeso,
    required this.status,
  });

  // Función para obtener el color del estado IMC
  Color getIMCStatusColor(double imc) {
    if (imc < 18.5) {
      return Colors.red;
    } else if (imc < 24.9) {
      return Colors.green;
    } else if (imc < 29.9) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  // Función para obtener el emoji correspondiente al estado IMC
  String getEmoji(double imc) {
    if (imc < 18.5) {
      return '😞';
    } else if (imc < 24.9) {
      return '😊';
    } else if (imc < 29.9) {
      return '😐';
    } else {
      return '😞';
    }
  }

  static IMCData? fromJson(Map<String, dynamic> json, BuildContext context) {
    if (json['nombre'] != null &&
        json['imc'] != null &&
        json['peso'] != null &&
        json['sexo'] != null &&
        json['edad'] != null &&
        json['altura'] != null &&
        json['unidadAltura'] != null &&
        json['unidadPeso'] != null &&
        json['status'] != null) {
      return IMCData(
        nombre: json['nombre'],
        imc: json['imc'],
        peso: json['peso'],
        sexo: json['sexo'],
        edad: json['edad'],
        altura: json['altura'],
        unidadAltura: json['unidad'],
        unidadPeso: json['unidad'],
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
    const double imc = 32;
    return IMCData(
      nombre: 'John Doe',
      imc: imc,
      peso: 70.4,
      sexo: 1,
      edad: 30,
      altura: 175.3,
      unidadAltura: 'cm',
      unidadPeso: 'kg',
      status: getIMCStatus(imc),
    );
  }
}

class IMCCalculator {
  static double calcularIMC(IMCData imcData) {
    double peso = imcData.peso;
    double altura = imcData.altura;

    if (imcData.unidadPeso == 'lb') {
      // Convertir de libras a kilogramos
      peso = peso * 0.453592;
    }

    if (imcData.unidadAltura == 'ft') {
      // Convertir de pies a metros
      altura = altura / 3.281;
    } else if (imcData.unidadAltura == 'in') {
      // Convertir de pulgadas a metros
      altura = altura * 0.0254;
    } else if (imcData.unidadAltura == 'cm') {
      // Convertir de centímetros a metros
      altura = altura / 100;
    }

    // Calcular el IMC
    double imc = peso / (altura * altura);

    return imc;
  }
}
