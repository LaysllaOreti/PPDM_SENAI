import 'package:flutter/material.dart';
import 'package:aplicattion_coffe_shop/components/components.cardproduto.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tela de Produtos",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 30,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 59, 40, 32),
      ),

      body: Container(
        padding: const EdgeInsets.all(13),
        child: Column(
          children: [
            const SizedBox(height: 40),

            CardProduto(
              imagem: 'assets/bolinhoDuploChocolate.png',
              texto: 'Bolinho Duplo Chocolate (Bob Esponja) - Bauduco',
              descricao: 'Peso Líquido - 40g',
            ),

            const SizedBox(height: 20),

            CardProduto(
              imagem: 'assets/bolinhoGotasChocolate.png',
              texto: 'Bolinho com gotas de Chocolate - Bauduco',
              descricao: 'Peso Líquido - 40g',
            ),

            const SizedBox(height: 20),

            CardProduto(
              imagem: 'assets/bolinhoLaranja.png',
              texto: 'Bolinho Laranja - Bauduco',
              descricao: 'Peso Líquido - 40g',
            ),

            const SizedBox(height: 20),

            CardProduto(
              imagem: 'assets/bolinhoRecheioBaunilha.png',
              texto: 'Bolinho Recheio de Baunilha - Bauduco',
              descricao: 'Peso Líquido - 40g',
            ),

            const SizedBox(height: 20),

            CardProduto(
              imagem: 'assets/bolinhoSaborChocolate.png',
              texto: 'Bolinho Duplo Chocolate - Bauduco',
              descricao: 'Peso Líquido - 40g',
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
