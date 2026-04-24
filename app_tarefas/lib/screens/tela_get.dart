import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaGet extends StatefulWidget {
  const TelaGet({super.key});

  @override
  State<TelaGet> createState() => _TelaGetState();
}

class _TelaGetState extends State<TelaGet> {
  String resultado = "Toque no botão para ler a nuvem";
  bool isLoading = false;

  static const Color primaryPink = Color(0xFFF48FB1);
  static const Color accentPink = Color(0xFFFF4081);
  static const Color lightPink = Color(0xFFFCE4EC);
  static const Color deepGrey = Color(0XFF4A4A4A);

  void fazerGet() async {
    setState(() => isLoading = true);
    try {
      final resposta = await http.get(Uri.parse("https://json-server-tasks-bbub.onrender.com/tasks")).timeout(const Duration(seconds: 5));
      if (resposta.statusCode == 200) {
        final dados = jsonDecode(resposta.body);
        setState(() {
          resultado = dados.isNotEmpty ? dados[0]["title"] : "Nenhum dado na lista";
        });
      }
    } catch (e) {
      setState(() => resultado = "Erro ao conectar");
    } finally {
      setState(() => isLoading = false);
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
            const Text("CONSULTA", style: TextStyle(color: primaryPink, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 2)),
            Text("Sincronizar Dados", style: TextStyle(color: deepGrey.withOpacity(0.8), fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Icon(isLoading ? Icons.sync : Icons.cloud_done_rounded, size: 40, color: primaryPink),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(35),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(color: primaryPink.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))
                ],
              ),
              child: isLoading
                  ? const Center(child: CircularProgressIndicator(color: accentPink))
                  : Text(
                      resultado,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: deepGrey),
                    ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 200, 
              height: 55,
              child: ElevatedButton(
                onPressed: isLoading ? null : fazerGet,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryPink,
                  shape: const StadiumBorder(), 
                  elevation: 5,
                  shadowColor: primaryPink.withOpacity(0.3),
                ),
                child: const Text("ATUALIZAR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}