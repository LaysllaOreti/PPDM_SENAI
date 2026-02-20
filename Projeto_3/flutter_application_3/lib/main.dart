import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/pagina2.dart';
import 'package:flutter_application_3/screens/pagina3.dart';
import 'package:flutter_application_3/screens/pagina4.dart';

void main() {
  runApp(const Centralizadora());
}

class Centralizadora extends StatelessWidget {
  const Centralizadora({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TelaInicial(),
    );
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),

      // appbar fixa (MANTIVE SEU CÓDIGO)
      appBar: AppBar(
        title: const Text(
          "Banco das Pips",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 134, 5, 102),
      ),

      // body
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // card - saldo atual
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 134, 5, 102),
                    Color.fromARGB(255, 201, 42, 145),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Saldo atual",
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "R\$ 3.000,00",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Ações rápidas",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // primeira linha de 'row'
            Row(
              children: [
                Expanded(
                  child: botaoBanco(context, "PIX", Icons.pix, Pagina2()),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: botaoBanco(
                    context,
                    "BOLETO",
                    Icons.receipt_long,
                    Pagina3(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: botaoBanco(
                    context,
                    "CARTÃO",
                    Icons.credit_card,
                    Pagina4(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 80),

            // segunda linha de 'row'
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                acoes(context, Icons.pix, "Empréstimo", Pagina2()),
                acoes(context, Icons.payment, "Pagar", Pagina3()),
                acoes(context, Icons.send, "Transferir", Pagina4()),
                acoes(
                  context,
                  Icons.account_balance_wallet,
                  "Depositar",
                  Pagina2(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// botões
Widget botaoBanco(
  BuildContext context,
  String texto,
  IconData icone,
  Widget tela,
) {
  return TextButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => tela));
    },
    style: botaoPadrao(),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [Icon(icone, size: 30), const SizedBox(height: 8), Text(texto)],
    ),
  );
}

ButtonStyle botaoPadrao() {
  return TextButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 170, 18, 119),
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
  ).copyWith(
    overlayColor: MaterialStateProperty.all(
      const Color.fromARGB(255, 100, 0, 80),
    ),
  );
}

// botões circulares
Widget acoes(BuildContext context, IconData icon, String texto, Widget tela) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => tela));
    },
    child: Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: const Color.from(
              alpha: 1,
              red: 0.525,
              green: 0.02,
              blue: 0.4,
            ),
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          texto,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

// appbar 'fixa'
AppBar minhaAppBar() {
  return AppBar(
    title: const Text(
      "Banco das Pips",
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: const Color.fromARGB(255, 134, 5, 102),
  );
}
