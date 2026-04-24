import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaPost extends StatefulWidget {
  const TelaPost({super.key});

  @override
  State<TelaPost> createState() => _TelaPostState();
}

class _TelaPostState extends State<TelaPost> {
  TextEditingController valorDigitado = TextEditingController();

  static const Color primaryPink = Color(0xFFF48FB1);
  static const Color lightPink = Color(0xFFFCE4EC);
  static const Color deepGrey = Color(0XFF4A4A4A);

  void fazerPost() async {
    final respostaServidor = await http.post(
      Uri.parse("https://json-server-tasks-bbub.onrender.com/tasks"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": valorDigitado.text})
    );

    if (respostaServidor.statusCode == 201 || respostaServidor.statusCode == 200){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Dados enviados com sucesso!!", textAlign: TextAlign.center),
          backgroundColor: primaryPink,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.all(20),
        )
      );
      valorDigitado.clear();
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
            const Text("NOVA TAREFA", style: TextStyle(color: primaryPink, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 2)),
            Text("Adicionar ao Plano", style: TextStyle(color: deepGrey.withOpacity(0.8), fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: primaryPink.withOpacity(0.1), blurRadius: 20)],
                ),
                child: const Icon(Icons.note_add_rounded, size: 60, color: primaryPink),
              ),
              const SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(color: primaryPink.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5))
                  ],
                ),
                child: TextField(
                  controller: valorDigitado,
                  style: const TextStyle(color: deepGrey, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: "O que precisa ser feito?",
                    hintStyle: TextStyle(color: deepGrey.withOpacity(0.4)),
                    prefixIcon: const Icon(Icons.edit_note_rounded, color: primaryPink),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 65,
                child: ElevatedButton(
                  onPressed: fazerPost,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryPink,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    elevation: 5,
                    shadowColor: primaryPink.withOpacity(0.4),
                  ),
                  child: const Text("ADICIONAR TAREFA", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}