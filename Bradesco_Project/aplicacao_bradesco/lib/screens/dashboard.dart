import 'package:flutter/material.dart';
import 'package:aplicacao_bradesco/main.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(236, 255, 255, 255),

      // navbar
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(237, 207, 28, 28),
        elevation: 0,
        title: const Text(
          "Bradesco",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
        centerTitle: false,
      ),

      // body
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 380,
            padding: const EdgeInsets.all(6),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // título
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Olá, Layslla",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // gráfico 1
                Center(
                  child: Image.asset(
                    "assets/dashboard1.png",
                    width: 340,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 20),

                // gráfico 2
                Center(
                  child: Image.asset(
                    "assets/dashboard2.png",
                    width: 340,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 30),

                // botão sair
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 67, 65, 138),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Centralizadora(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sair",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
