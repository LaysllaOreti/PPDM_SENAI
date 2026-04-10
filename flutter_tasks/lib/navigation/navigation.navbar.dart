import 'package:flutter/material.dart';

// Importação das telas
import 'package:flutter_tasks/screens/screens.teladelete.dart';
import 'package:flutter_tasks/screens/screens.telaget.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // Faça a lógica aqui
  int indexAtual = 0; // Variável para ver qual tela está sendo selecionada

  List pages = [
    // Lista para armazenar as páginas
    TelaGet(),
    TelaDelete(),
  ];

  void mudarIndex(int novoIndex) {
    setState(() {
      indexAtual = novoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(indexAtual),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(
          255,
          253,
          237,
          242,
        ), 
        selectedItemColor: const Color.fromARGB(
          255,
          107,
          16,
          46,
        ), 
        unselectedItemColor: const Color.fromARGB(
          255,
          133,
          25,
          61,
        ).withOpacity(0.5), 
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.get_app), label: "Get"),
          BottomNavigationBarItem(icon: Icon(Icons.delete), label: "Delete"),
        ],
        currentIndex: indexAtual,
        onTap: mudarIndex,
      ),
    );
  }
}
