import 'package:flutter/material.dart';

class Imc {
  final String _id = UniqueKey().toString();
  int _altura = 0;
  double _peso = 0;

  Imc(this._altura, this._peso);

  String getId() {
    return _id;
  }

  int getAltura() {
    return _altura;
  }

  void setAltura(int altura) {
    _altura = altura;
  }

  double getPeso() {
    return _peso;
  }

  void setPeso(double peso) {
    _peso = peso;
  }
}
