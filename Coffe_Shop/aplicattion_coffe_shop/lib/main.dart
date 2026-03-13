import 'package:flutter/material.dart';
 import 'package:aplicattion_coffe_shop/screens/screens.telainicial.dart';
 
//Main funcionará como uma configuração das minhas telas
 
void main() {
  runApp(const MyApp());
}
 
//Classe do materialApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    //Return dela deve ser o MaterialApp
    return MaterialApp(
      //Tela Inicial
      home: TelaInicial()
    );
  }
}