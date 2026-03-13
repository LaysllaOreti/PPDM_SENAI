import 'package:flutter/material.dart';

class Descricao extends StatelessWidget {
  String texto; // componente espera receber uma variável string
  Color? cor = Colors.black; // quando não é obrigatório, passamos um sinal de interrogação. por padrão, a cor será preta
  // como o valor de 'texto' não será sempre o mesmo, ele deixa de ser constante (tira o const)
  Descricao({
    super.key,
    required this.texto,
    this.cor,
  }); //required deixa a classe ser obrigatória

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(
        color: cor,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
