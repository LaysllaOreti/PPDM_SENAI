import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaDelete extends StatefulWidget {
  const TelaDelete({super.key});

  @override
  State<TelaDelete> createState() => _TelaDeleteState();
}

class _TelaDeleteState extends State<TelaDelete> {
  List listApi = [];
  bool isLoading = true;

  static const Color primaryPink = Color(0xFFF48FB1);
  static const Color accentPink = Color(0xFFFF4081);
  static const Color lightPink = Color(0xFFFCE4EC);
  static const Color deepGrey = Color(0XFF4A4A4A);

  @override
  void initState() {
    super.initState();
    fazerGet();
  }

  void fazerGet() async {
    try {
      final respostaServidor = await http.get(Uri.parse("https://json-server-tasks-bbub.onrender.com/tasks"));
      if (respostaServidor.statusCode == 200) {
        final dados = jsonDecode(respostaServidor.body);
        setState(() {
          listApi = dados;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() => isLoading = false);
      _mostrarMensagemCustomizada("Erro ao carregar dados", Colors.redAccent);
    }
  }

  void _confirmarExclusao(final id, String titulo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          backgroundColor: lightPink,
          title: const Text("Excluir Tarefa", style: TextStyle(fontWeight: FontWeight.bold, color: deepGrey)),
          content: Text("Deseja realmente apagar a tarefa:\n\"$titulo\"?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar", style: TextStyle(color: deepGrey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: accentPink,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.pop(context);
                fazerDelete(id);
              },
              child: const Text("Confirmar", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void fazerDelete(final id) async {
    final respostaServidor = await http.delete(Uri.parse("https://json-server-tasks-bbub.onrender.com/tasks/$id"));
    if (respostaServidor.statusCode == 200) {
      fazerGet();
      _mostrarMensagemCustomizada("Tarefa removida com sucesso!", primaryPink);
    }
  }

  void _mostrarMensagemCustomizada(String texto, Color cor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(texto, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: cor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(20),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPink,
      body: Stack(
        children: [
          Positioned(
            top: -60, right: -60,
            child: Container(
              width: 220, height: 220,
              decoration: BoxDecoration(color: primaryPink.withOpacity(0.15), shape: BoxShape.circle),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 30, 25, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("GERENCIAR", style: TextStyle(fontSize: 14, letterSpacing: 2, color: primaryPink.withOpacity(0.8), fontWeight: FontWeight.bold)),
                      const Text("Minhas Tarefas", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: primaryPink, letterSpacing: -0.5)),
                      const SizedBox(height: 12),
                      Container(width: 60, height: 6, decoration: BoxDecoration(color: accentPink, borderRadius: BorderRadius.circular(10))),
                    ],
                  ),
                ),
                Expanded(
                  child: isLoading 
                    ? const Center(child: CircularProgressIndicator(color: primaryPink))
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: listApi.length,
                        itemBuilder: (context, index) {
                          final item = listApi[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [BoxShadow(color: primaryPink.withOpacity(0.08), blurRadius: 15, offset: const Offset(0, 8))],
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(12),
                              leading: Container(
                                width: 55, height: 55,
                                decoration: BoxDecoration(color: lightPink, borderRadius: BorderRadius.circular(18)),
                                child: const Icon(Icons.task_alt_rounded, color: primaryPink),
                              ),
                              title: Text(item["title"] ?? "Sem título", style: const TextStyle(fontWeight: FontWeight.w700, color: deepGrey)),
                              trailing: IconButton(
                                onPressed: () => _confirmarExclusao(item["id"], item["title"] ?? ""),
                                icon: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(color: accentPink.withOpacity(0.1), shape: BoxShape.circle),
                                  child: const Icon(Icons.delete_sweep_rounded, color: accentPink),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}