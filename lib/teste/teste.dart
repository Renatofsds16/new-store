import 'package:new_store/teste/teste274.dart';

void main() {
  FuncionarioTecerizado funcionarioTecerizado =
      FuncionarioTecerizado();
  funcionarioTecerizado.qtdHoras = 100;
  funcionarioTecerizado.valorPorHora = 10.0;
  print(funcionarioTecerizado.pagamento());
}



