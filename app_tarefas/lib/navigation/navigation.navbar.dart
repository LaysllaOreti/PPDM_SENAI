import 'package:app_tarefas/screens/screens_telaLocal.dart';
import 'package:app_tarefas/screens/tela_delete.dart';
import 'package:app_tarefas/screens/tela_get.dart';
import 'package:app_tarefas/screens/tela_post.dart';
import 'package:app_tarefas/screens/tela_put.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavbarState();
}

class _NavbarState extends State<NavBar> {
  int indexAtual = 0;

  // Paleta de Cores Rosa (Mantendo o padrão das outras telas)
  static const Color primaryPink = Color(0xFFF48FB1);
  static const Color accentPink = Color(0xFFFF4081);
  static const Color lightPink = Color(0xFFFCE4EC);

  List pages = [
    const TelaGet(),
    const TelaDelete(),
    const TelaPost(),
    const TelaPut(),
    const TelaLocal(),
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
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        
        // Cores dos itens
        selectedItemColor: accentPink,
        unselectedItemColor: primaryPink.withOpacity(0.5),
        
        // Estilo do texto
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_download_rounded), 
            activeIcon: Icon(Icons.cloud_download),
            label: "Consultar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete_outline_rounded), 
            activeIcon: Icon(Icons.delete_forever_rounded),
            label: "Excluir",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded), 
            activeIcon: Icon(Icons.add_circle_rounded),
            label: "Criar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_outlined), 
            activeIcon: Icon(Icons.edit_rounded),
            label: "Editar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined), 
            activeIcon: Icon(Icons.location_on_rounded),
            label: "Local",
          ),
        ],

        currentIndex: indexAtual,
        onTap: mudarIndex,
        elevation: 20, // Sombra leve para destacar do fundo rosa das telas
      ),
    );
  }
}