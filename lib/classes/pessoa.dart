class Pessoa {
  String _nome = "";
  double _peso = 0;
  double _altura = 0;

  Pessoa(String nome, double peso, double altura) {
    _nome = nome;
    _peso = peso;
    _altura = altura;
  }

  void setNome(String nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  double getPeso() {
    return _peso;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  double getAltura() {
    return _altura;
  }

  void verAltura() {
    if (_altura > 3) {
      // Se a altura for maior que 3 metros, assume-se que está em centímetros
      _altura /= 100.0; // Converta de centímetros para metros
    }
  }

  double calcularIMC() {
    verAltura(); // Chama o método verAltura para verificar e converter a altura, se necessário
    double imc = _peso / (_altura * _altura);
    return double.parse(
        imc.toStringAsFixed(2)); // Arredonda o IMC para 2 casas decimais
  }

  String classificarIMC() {
    double imc = calcularIMC();
    if (imc < 16) {
      return 'Magreza Grave';
    } else if (imc < 17) {
      return 'Magreza Moderada';
    } else if (imc < 18.5) {
      return 'Magreza Leve';
    } else if (imc < 25) {
      return 'Saudável';
    } else if (imc < 30) {
      return 'Sobrepeso';
    } else if (imc < 35) {
      return 'Obesidade Grau 1';
    } else if (imc < 40) {
      return 'Obesidade Grau 2 (Severa)';
    } else {
      return 'Obesidade Grau 3 (Mórbida)';
    }
  }

  @override
  String toString() {
    return {
      "Senhor(a)": _nome,
      "se seu peso é": _peso,
      "e sua altura é": _altura,
      "então seu IMC é": calcularIMC()
    }.toString();
  }
}
