import 'package:flutter/material.dart';
import 'screens/login.dart';

void main() {
  runApp(const Centralizadora());
}

class Centralizadora extends StatelessWidget {
  const Centralizadora({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaInicial(),
    );
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo - bradesco
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Image.asset('assets/bradesco.png', width: 300),
            ),

            // SizedBox: Cria espaço entre os elementos
            const SizedBox(height: 25),

            // frase inicial
            const Text(
              "Simplificando o presente. Construindo o futuro.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(221, 0, 0, 0),
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 10),

            // frase 2
            const Text(
              "Bradesco, sempre com você!",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF9D0D21),
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 35),

            // botão - acessar a tela de Login
            SizedBox(
              width: 280,
              height: 50,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.login, color: Colors.white, size: 30),
                label: const Text(
                  "Comece agora",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC2187A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
