import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/links.dart';

class Linkspage extends StatelessWidget {
  const Linkspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body : Center(
        child: Column(
          children: [
            Links(url: 'https://github.com/LaysllaOreti', image: "https://logosmarcas.net/github-logo/")
          ],
        ),
       )
    );
  }
}