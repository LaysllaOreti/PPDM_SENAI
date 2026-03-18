import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Links extends StatelessWidget {
  final String url;
  final String image;

  const Links({
    super.key,
    required this.url,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.grey,
      child: Column(
        children: [
          GestureDetector(
            child: Image.network(image),
            onTap: () async {
              Uri converterUrl = Uri.parse(url);

              if (await canLaunchUrl(converterUrl)) {
                await launchUrl(converterUrl);
              } else {
                // Caso não consiga abrir o link
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Não foi possível abrir o link'),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}