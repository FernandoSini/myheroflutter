import 'package:flutter/material.dart';

class WebErrorScreen extends StatefulWidget {
  const WebErrorScreen({Key? key}) : super(key: key);

  @override
  State<WebErrorScreen> createState() => _WebErrorScreenState();
}

class _WebErrorScreenState extends State<WebErrorScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                child: const Text("Not Found!"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
