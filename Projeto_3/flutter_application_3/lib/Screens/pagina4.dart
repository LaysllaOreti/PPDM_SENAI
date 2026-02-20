import 'package:flutter/material.dart';
import 'package:flutter_application_3/main.dart';

class Pagina4 extends StatelessWidget {
  const Pagina4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: minhaAppBar(),
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Gerenciar meus cartões",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // card visual -  cartão
            Container(
              width: double.infinity,
              height: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 105, 16, 83),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "BANCO DAS PIPS",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    "**** **** **** 1008",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "LAYSLLA E. O. DE PAIVA",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text("09/32", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Limite
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Limite disponível (R\$)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: const Icon(Icons.credit_card),
              ),
            ),

            const SizedBox(height: 20),

            // Fatura
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Valor da fatura (R\$)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: const Icon(Icons.receipt_long),
              ),
            ),

            const SizedBox(height: 20),

            // Nome do cartão
            TextField(
              decoration: InputDecoration(
                labelText: "Nome no cartão",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: const Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 40),

            // Botão pagar fatura
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 134, 5, 102),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Fatura paga"),
                        content: const Text(
                          "Pagamento do cartão realizado com sucesso!",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  "Pagar Fatura",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
