import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaLocal extends StatefulWidget {
  const TelaLocal({super.key});

  @override
  State<TelaLocal> createState() => _TelaLocalState();
}

class _TelaLocalState extends State<TelaLocal> {
  List<String> items = [];
  TextEditingController valorDigitado = TextEditingController();

  // Paleta de Cores Rosa
  static const Color primaryPink = Color(0xFFF48FB1);
  static const Color accentPink = Color(0xFFFF4081);
  static const Color lightPink = Color(0xFFFCE4EC);
  static const Color deepGrey = Color(0XFF4A4A4A);

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    final dados = await SharedPreferences.getInstance();
    setState(() {
      items = dados.getStringList('nomes') ?? [];
    });
  }

  void criarDados() async {
    if (valorDigitado.text.isEmpty) return;
    
    final dados = await SharedPreferences.getInstance();
    setState(() {
      items.add(valorDigitado.text);
    });

    await dados.setStringList('nomes', items);
    valorDigitado.clear();
    carregarDados();
  }

  void deletarDados(int index) async {
    final dados = await SharedPreferences.getInstance();
    setState(() {
      items.removeAt(index);
    });
    await dados.setStringList('nomes', items);
    carregarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPink,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            const Text("OFFLINE", style: TextStyle(color: primaryPink, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2)),
            Text("Memória Local", style: TextStyle(color: deepGrey.withOpacity(0.8), fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Campo de Entrada Estilizado
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: primaryPink.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4))
                ],
              ),
              child: TextField(
                controller: valorDigitado,
                decoration: InputDecoration(
                  hintText: "Adicionar item local...",
                  hintStyle: TextStyle(color: deepGrey.withOpacity(0.4)),
                  prefixIcon: const Icon(Icons.bookmark_border_rounded, color: primaryPink),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add_circle_rounded, color: accentPink, size: 30),
                    onPressed: criarDados,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
            ),
            const SizedBox(height: 25),
            
            // Lista de Itens
            Expanded(
              child: items.isEmpty
                  ? Center(
                      child: Text(
                        "Nenhum dado salvo localmente",
                        style: TextStyle(color: deepGrey.withOpacity(0.5)),
                      ),
                    )
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 4))
                            ],
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            leading: const CircleAvatar(
                              backgroundColor: lightPink,
                              child: Icon(Icons.storage_rounded, color: primaryPink, size: 20),
                            ),
                            title: Text(
                              items[index],
                              style: const TextStyle(color: deepGrey, fontWeight: FontWeight.w600),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent, size: 22),
                              onPressed: () => deletarDados(index),
                            ),
                          ),
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