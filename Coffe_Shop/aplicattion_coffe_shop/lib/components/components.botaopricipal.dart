import 'package:flutter/material.dart';

class BotaoPrincipal extends StatelessWidget {
  Widget pagina;
  String texto;

  BotaoPrincipal({super.key, required this.pagina, required this.texto});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.brown, // cor de fundo
        foregroundColor: Colors.white, // cor do texto
        fixedSize: Size(150, 20), // tamanho do botão (width, height)
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pagina),
        );
      },
      child: Text(texto),
    );
  }
}
