import 'package:flutter/material.dart';

class WebHeroesScreen extends StatefulWidget {
  const WebHeroesScreen({Key? key}) : super(key: key);

  @override
  State<WebHeroesScreen> createState() => _WebHeroesScreenState();
}

class _WebHeroesScreenState extends State<WebHeroesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text(
            "all heroes",
          ),
        ),
      ),
    );
  }
}
