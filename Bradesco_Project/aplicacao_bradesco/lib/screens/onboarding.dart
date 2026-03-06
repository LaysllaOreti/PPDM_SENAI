import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

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

              const SizedBox(height: 10),

              // subtítulo
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Bem-vinda ao seu painel. Aqui você poderá acompanhar suas informações e gerenciar sua conta.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(221, 0, 0, 0),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // card de saldo
              Container(
                width: double.infinity,
                height: 150,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(235, 156, 6, 6),
                      Color.fromARGB(236, 206, 74, 103),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(66, 100, 100, 100),
                      blurRadius: 10,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // título
                    const Text(
                      "Saldo atual",
                      style: TextStyle(
                        color: Color.fromARGB(179, 255, 255, 255),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // valor
                    const Text(
                      "R\$ 15.500,90",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Spacer(),

                    // nome da pessoa
                    const Text(
                      "Layslla Eduarda de Paiva",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
