import 'package:flutter/material.dart';

class Imc {
  final String _id = UniqueKey().toString();
  double _altura = 0;
  double _peso = 0;

  Imc(this._altura, this._peso);

  String getId() {
    return _id;
  }

  double getAltura() {
    return _altura;
  }

  void setAltura(int altura) {
    _altura = double.parse((altura / 100) as String);
  }

  double getPeso() {
    return _peso;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  double calcularIMC(Imc imc) {
    double imcs = imc.getPeso() / (imc.getAltura() * imc.getAltura());
    return double.parse(
        imcs.toStringAsFixed(2)); // Arredonda o IMC para 2 casas decimais
  }

  String classificarIMC(Imc imc) {
    double imcs = imc.getPeso() / (imc.getAltura() * imc.getAltura());
    if (imcs < 16) {
      return 'Magreza Grave';
    } else if (imcs < 17) {
      return 'Magreza Moderada';
    } else if (imcs < 18.5) {
      return 'Magreza Leve';
    } else if (imcs < 25) {
      return 'Saudável';
    } else if (imcs < 30) {
      return 'Sobrepeso';
    } else if (imcs < 35) {
      return 'Obesidade Grau 1';
    } else if (imcs < 40) {
      return 'Obesidade Grau 2 (Severa)';
    } else {
      return 'Obesidade Grau 3 (Mórbida)';
    }
  }
}
