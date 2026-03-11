import 'package:flutter/material.dart';
import 'dashboard.dart';

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
        child: SingleChildScrollView(
          child: Container(
            width: 380,
            padding: const EdgeInsets.all(6),

            child: Column(
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
                const Text(
                  "Bem-vinda ao seu painel. Aqui você poderá acompanhar suas informações e gerenciar sua conta.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(221, 0, 0, 0),
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
                        Color.fromARGB(235, 97, 5, 5),
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
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Saldo atual",
                        style: TextStyle(
                          color: Color.fromARGB(179, 255, 255, 255),
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "R\$ 15.500,90",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Layslla Eduarda de Paiva",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // carrossel
                SizedBox(
                  height: 280,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/imagemCarrossel1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/imagemCarrossel2.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/imagemCarrossel3.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // frase
                const Text(
                  "Gerencie suas finanças com precisão e facilidade em um só lugar!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(221, 0, 0, 0),
                  ),
                ),

                const SizedBox(height: 20),

                // botão
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 170, 24, 31),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Dashboard(),
                        ),
                      );
                    },
                    child: const Text(
                      "Acessar Dashboard",
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
