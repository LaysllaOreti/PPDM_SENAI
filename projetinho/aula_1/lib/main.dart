// biblioteca que importa os componentes do flutter
import 'package:flutter/material.dart';

// importando as funções do dart
import 'dart:io';

void main() {
  runApp(TelaInicial());
}

// precisa colocar essa parte toda vez que for criar uma tela (estrutura padrão)
class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // MaterialApp provê os componentes para a sua tela
      home: Scaffold(
        // divide a tela em até 3 partes
        appBar: AppBar(
          title: Text(
            "Tela Inicial - Primeira Aplicação",
            style: TextStyle(
              color: const Color(0xFF89219B),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
          backgroundColor: const Color(0x60969393),
        ),

        // body =  conteúdo principal
        body: Column(
          spacing: 30, // espaçamento
          mainAxisAlignment: MainAxisAlignment.start, // ordenar os elementos
          children: [
            Container(
              width: 200,
              height: 80,
              color: const Color.fromARGB(255, 159, 61, 240),
              margin: EdgeInsets.only(top: 20),
            ),
            Container(
              width: 200,
              height: 80,
              color: const Color.fromARGB(255, 135, 77, 182),
            ),
            Container(
              width: 200,
              height: 80,
              color: const Color.fromARGB(255, 70, 34, 99),
            ),
            Container(
              width: 200,
              height: 80,
              color: const Color.fromARGB(255, 30, 14, 44),
            ),
            Container(
              width: 200,
              height: 80,
              color: const Color.fromARGB(255, 20, 8, 31),
            ),
            Row(
              spacing: 20, // espaçamento
              mainAxisAlignment: MainAxisAlignment.center, // ordenar os elementos
              children: [
                Container(
                  width: 60,
                  height: 60,
                  color: const Color.fromARGB(255, 159, 61, 240),
                ),
                Container(
                  width: 60,
                  height: 60,
                  color: const Color.fromARGB(255, 135, 77, 182),
                ),
                Container(
                  width: 60,
                  height: 60,
                  color: const Color.fromARGB(255, 70, 34, 99),
                ),
                Container(
                  width: 60,
                  height: 60,
                  color: const Color.fromARGB(255, 30, 14, 44),
                ),
                Container(
                  width: 60,
                  height: 60,
                  color: const Color.fromARGB(255, 20, 8, 31),
                ),
                
              ],
            ),
          ],
        ),
      ),
    ); //MaterialApp
  }
}
