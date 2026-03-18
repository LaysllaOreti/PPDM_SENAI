import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Links extends StatelessWidget {
  String url;
  String image;

  Links({super.key, required this.url, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.grey,
      child: Column(
        children: [
          //Atribui uma ação ao componente filho
          GestureDetector(
            child: //Imagem que será passada
            Image.network(
              image,
            ),
            onTap: () async{
              //Para o flutter entender a sua url, transforme para url
              Uri converterUrl = Uri.parse(url);
              //Se a função de lauch for true
              if (await canLaunchUrl(converterUrl)){ 
                //Transição para o link externo
                await(launchUrl(converterUrl));
              }

            },
          ),
        ],
      ),
    );
  }
}
