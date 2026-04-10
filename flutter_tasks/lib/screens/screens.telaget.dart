import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class TelaGet extends StatefulWidget {
  const TelaGet({super.key});

  @override
  State<TelaGet> createState() => _TelaGetState();
}

class _TelaGetState extends State<TelaGet> {
  // Faça a lógica aqui

  String resultado = "";

  // final é uma variável que aguarda receber um valor
  // Uri é usado para decifrar requisições da Url
  void fazerGet() async {
    // Função assíncrona pois espera o resultado da requisição/servidor
    final respostaServidor = await http.get(
      Uri.parse("http://10.109.72.35:3000/tasks"),
    );

    // se a resposta do servidor for 200
    // decodifico a resposta
    // atrelo o valor a variável resultado

    if (respostaServidor.statusCode == 200) {
      final dados = jsonDecode(respostaServidor.body);

      setState(() {
        resultado = dados[0]["title"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela GET")),
      body: Center(
        child: Column(
          children: [
            Text(resultado),
            TextButton(onPressed: fazerGet, child: Text("Fazer Get")),
          ],
        ),
      ),
    );
  }
}
