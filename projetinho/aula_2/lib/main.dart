import 'package:flutter/material.dart';

void main() { // função principal que executa o código

  // roda o App
  runApp(TelaContador());
}

class TelaContador extends StatefulWidget {
  // aqui você coloca os parâmetros para a sua tela

  const TelaContador({super.key});

  @override
  State<TelaContador> createState() => _TelaContadorState();
}

class _TelaContadorState extends State<TelaContador> {
  // aqui você colocar a lógica em Dart
  int contador = 0; // variável que irá mostrar o número na tela

  void add(){
    setState(() {
      contador++; // aumenta 1 unidade do valor da variável
    });
  }

  void sub(){
    setState(() {
      if(contador > 0){
        contador--;
      }
    });
  }

  void reset(){
    setState(() {
      contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // importa todos os widgets/componentes - exemplo: botão, texto, navbar
    home: Scaffold( // ele permite separar a tela e até 3 partes
      appBar: AppBar(title: Text("App Contador")),
      body: Center(//ajuda a centralizar
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$contador"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextButton(style: TextButton.styleFrom(backgroundColor: Colors.pink), onPressed: add, child: Icon(Icons.add)),
              TextButton(onPressed: sub, child: Icon(Icons.remove)),
              TextButton(onPressed: reset, child: Icon(Icons.refresh))
            ],)
          ],
        ),
      ),
    ),
    );
  }
}