import 'package:flutter/material.dart';

class CardProduto extends StatelessWidget {
  final String imagem;
  final String texto;
  final String descricao;

  const CardProduto({
    super.key,
    required this.imagem,
    required this.texto,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 168, 125, 109),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            child: Image.asset(
              imagem,
              height: 120,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                texto,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.2,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 6),
              Text(
                descricao,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(221, 243, 243, 243),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
