import 'package:flutter/material.dart';

import '../../widgets/app_bar_widget.dart';

class WebHomeScreen extends StatefulWidget {
  const WebHomeScreen({Key? key}) : super(key: key);

  @override
  State<WebHomeScreen> createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff1418FA),
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100), child: AppBarWidget()),
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        children: [
          Container(
            height: screenSize.height,
            width: screenSize.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "./assets/heroes/background/My-Hero-Academia-Season-6.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.transparent,
                    child: Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          "6th Season 2022 Autumn",
                          style: TextStyle(
                            wordSpacing: 10,
                            fontFamily: 'MyHeroFont',
                            fontSize: 70,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 10
                              ..color = Colors.black,
                          ),
                        ),

                        // Solid text as fill.
                        Text(
                          "6th Season 2022 Autumn",
                          style: const TextStyle(
                            wordSpacing: 10,
                            fontFamily: 'MyHeroFont',
                            fontSize: 70,
                            color: Colors.yellow,
                          ),
                        ),
                      ],
                    ),
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
