class Funcionario {
  String? _nome;
  int _qtdHoras = 0;
  double _valorPorHora =0.0;




  double pagamento() {
    return qtdHoras * valorPorHora;
  }

  String? get nome => _nome;

  set nome(String? value) {
    _nome = value;
  }

  int get qtdHoras => _qtdHoras;

  set qtdHoras(int value) {
    _qtdHoras = value;
  }

  double get valorPorHora => _valorPorHora;

  set valorPorHora(double value) {
    _valorPorHora = value;
  }
}




class FuncionarioTecerizado extends Funcionario {
  double custoAdicional = 0.1;

  @override
  double pagamento() {
    double resultado = qtdHoras * valorPorHora;
    double adicional = resultado * custoAdicional;
    return adicional + resultado;
  }


}