import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

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
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        leadingWidth: 300,
        leading: Material(
          type: MaterialType.transparency,
          elevation: 0,
          child: InkWell(
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              QR.navigator.replaceAll("/");
            },
            child: Image.asset(
              "assets/logo/my_hero_academia_logo.png",
              isAntiAlias: true,
              height: 150,
              width: 150,
            ),
          ),
        ),
        actions: [
          Container(
              //color: Colors.green,

              ),
        ],
        centerTitle: true,
        title: Container(
          child: Stack(
            children: <Widget>[
              // Stroked text as border.
              Container(
                color: Colors.transparent,
                child: Text(
                  "Error",
                  style: TextStyle(
                    wordSpacing: 20,
                    fontFamily: 'MyHeroFont',
                    fontSize: 50,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 5
                      ..color = Colors.black,
                  ),
                ),
              ),
              // Solid text as fill.
              Text(
                "Error",
                style: const TextStyle(
                  wordSpacing: 20,
                  fontFamily: 'MyHeroFont',
                  fontSize: 50,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 0),
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage("./assets/heroes/background/DekuCrying1.gif"),
                  fit: BoxFit.cover,
                ),
              ),
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: Text(
                              "404",
                              style: TextStyle(
                                wordSpacing: 20,
                                fontFamily: 'MyHeroFont',
                                fontSize: 180,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 10
                                  ..color = Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            "404",
                            style: const TextStyle(
                              wordSpacing: 20,
                              fontFamily: 'MyHeroFont',
                              fontSize: 180,
                              color: Colors.yellow,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: Text(
                              "Not Found!",
                              style: TextStyle(
                                wordSpacing: 20,
                                fontFamily: 'MyHeroFont',
                                fontSize: 80,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 10
                                  ..color = Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            "Not Found!",
                            style: const TextStyle(
                              wordSpacing: 20,
                              fontFamily: 'MyHeroFont',
                              fontSize: 80,
                              color: Colors.yellow,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
