import 'package:flutter/material.dart';

// Importação de componentes
import 'package:flutter_tasks/navigation/navigation.navbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      // Mantém a espera de 4 segundos antes de navegar
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Navbar()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 237, 242),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.task,
              size: 90,
              color: Color.fromRGBO(102, 23, 50, 1),
            ),
            const SizedBox(height: 20),

            // Título Principal
            const Text(
              "App Tasks da Lay",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 107, 16, 46),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Divider(
                color: Color.fromARGB(255, 133, 25, 61),
                thickness: 1,
                height: 30,
              ),
            ),

            // Subtítulo
            const Text(
              "Bem-vindo(a) ao seu Gerenciador de Tarefas",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
