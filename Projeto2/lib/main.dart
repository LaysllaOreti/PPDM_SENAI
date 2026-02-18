import 'package:flutter/material.dart';
//dart:io - importar funções da linguagem

void main() {
  /* Função principal que executa o código */
  /* Roda o APP */
  runApp(
    TelaContador(),
  ); /* Se a tela precisa receber parâmetros, não usar 'const' | Mesmo que 'caiba' a 'const', não é recomendado */
}

/* usar 'st' para visualizar as opções de tipos de telas */
class TelaContador extends StatefulWidget {
  /* Onde é colocado os parâmetros da tela */
  const TelaContador({super.key});

  @override
  State<TelaContador> createState() => _TelaContadorState();
}

class _TelaContadorState extends State<TelaContador> {
  /* A lógica é colocada aqui */
  int contador = 0; /* Variável que irá mostrar o número na tela */

  /* Função para aumentar mais um número no contador */
  void add() {
    /* Para que a tela não recarregue toda vez que a função for chamada */
    setState(() {
      contador++; /* Aumenta um número ao contador */
    });
  }

  /* Função para diminuir mais um número no contador */
  void sub() {
    setState(() {
      if (contador > 0) {
        contador--;
      }
    });
  }

  /* Função para resetar o contador */
  void reset() {
    setState(() {
      contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* Para tirar o Debug da tela, que é mostrado automaticamente */
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Contador - Layslla Eduarda Oreti",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          /* Título */
          backgroundColor: const Color.fromARGB(255, 54, 12, 126) /* Cor */,
          centerTitle: true,
        ),

        /* 'Center' serve para deixar absolutamente tudo centralizado */
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$contador",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 30,
                  children: [
                    /* Botão */
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: add,
                      child: Icon(Icons.add),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: sub,
                      child: Icon(Icons.remove),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: reset,
                      child: Icon(Icons.refresh),
                    ),
                  ] /* Cham a função de adicionar */,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
