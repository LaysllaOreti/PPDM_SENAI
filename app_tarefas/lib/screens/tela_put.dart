import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaPut extends StatefulWidget {
  const TelaPut({super.key});

  @override
  State<TelaPut> createState() => _TelaPutState();
}

class _TelaPutState extends State<TelaPut> {
  List listaApi = [];
  List controladores = [];

  // Paleta de Cores Rosa
  static const Color primaryPink = Color(0xFFF48FB1); // Rosa Médio
  static const Color accentPink = Color(0xFFFF4081);  // Rosa Vibrante
  static const Color lightPink = Color(0xFFFCE4EC);   // Rosa Fundo
  static const Color deepGrey = Color(0XFF4A4A4A);

  @override
  void initState() {
    super.initState();
    fazerGet();
  }

  void fazerGet() async {
    final respostaServidor = await http.get(Uri.parse("https://json-server-tasks-bbub.onrender.com/tasks"));
    if (respostaServidor.statusCode == 200) {
      final dados = jsonDecode(respostaServidor.body);
      setState(() {
        listaApi = dados;
        controladores = []; 
        for (final item in listaApi) {
          controladores.add(TextEditingController());
        }
      });
    }
  }

  void fazerPut(final id, final index) async {
    final respostaServidor = await http.patch(
        Uri.parse("https://json-server-tasks-bbub.onrender.com/tasks/$id"),
        headers: {"Content-type": "application/json"},
        body: jsonEncode({"title": controladores[index].text}));

    if (respostaServidor.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Título atualizado com sucesso!", textAlign: TextAlign.center),
          backgroundColor: primaryPink,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.all(20),
        ),
      );
      fazerGet();
    }
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
            const Text("GERENCIAR", style: TextStyle(color: primaryPink, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2)),
            Text("Editar Tarefas", style: TextStyle(color: deepGrey.withOpacity(0.8), fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: listaApi.isEmpty
          ? const Center(child: CircularProgressIndicator(color: primaryPink))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: listaApi.length,
              itemBuilder: (context, index) {
                final item = listaApi[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: primaryPink.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(color: lightPink, borderRadius: BorderRadius.circular(10)),
                            child: const Icon(Icons.edit_note_rounded, color: primaryPink),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              item["title"],
                              style: const TextStyle(fontWeight: FontWeight.w900, color: deepGrey, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 55,
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: lightPink,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: accentPink.withOpacity(0.4), width: 2),
                              ),
                              child: TextField(
                                controller: controladores[index],
                                decoration: const InputDecoration(
                                  hintText: "Digite o novo nome...",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => fazerPut(item["id"], index),
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: primaryPink,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(color: primaryPink.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))
                                ],
                              ),
                              child: const Icon(Icons.check_rounded, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}