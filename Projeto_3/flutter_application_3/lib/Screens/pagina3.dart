import 'package:flutter/material.dart';
import 'package:flutter_application_3/main.dart';

class Pagina3 extends StatelessWidget {
  const Pagina3({super.key});

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
              "Pagar Boleto",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Código do boleto
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Código de barras",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: const Icon(Icons.qr_code),
              ),
            ),

            const SizedBox(height: 20),

            // Valor
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Valor (R\$)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: const Icon(Icons.attach_money),
              ),
            ),

            const SizedBox(height: 20),

            // Data de vencimento
            TextField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: "Data de vencimento",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: const Icon(Icons.calendar_today),
              ),
            ),

            const SizedBox(height: 20),

            // Descrição
            TextField(
              decoration: InputDecoration(
                labelText: "Descrição (opcional)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: const Icon(Icons.description),
              ),
            ),

            const SizedBox(height: 40),

            // Botão pagar
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 172, 17, 133),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Boleto pago"),
                        content: const Text("Pagamento realizado com sucesso!"),
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
                  "Pagar Boleto",
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
