import 'package:aplicattion_coffe_shop/components/components.botaopricipal.dart';
import 'package:aplicattion_coffe_shop/components/components.descricao.dart';
import 'package:aplicattion_coffe_shop/components/components.titulo.dart';
import 'package:aplicattion_coffe_shop/screens/screens.telaprincipal.dart';

import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bem-vindo!"), backgroundColor: Colors.brown),

      body: Center(
        child: Column(
          children: [
            Titulo(), // vai aparecer um texto Coffe Shop com estilização
            Descricao(texto: "Bem-vindo ao App mais famoso de café!"),
            Descricao(
              texto: "Clique no botão para iniciar sua jornada!",
              cor: const Color.fromARGB(255, 68, 94, 107),
            ),
            BotaoPrincipal(pagina: TelaPrincipal(), texto: "Acessar"),
          ],
        ),
      ),
    );
  }
}
