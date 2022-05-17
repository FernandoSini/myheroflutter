import "package:flutter/material.dart";
import 'package:my_hero_academia/web/ui/widgets/hero_cover_widget.dart';
import 'package:my_hero_academia/web/ui/widgets/villain_cover_widget.dart';
import 'package:qlevar_router/qlevar_router.dart';

class WebCreateChoose extends StatefulWidget {
  const WebCreateChoose({Key? key}) : super(key: key);

  @override
  State<WebCreateChoose> createState() => _WebCreateChooseState();
}

class _WebCreateChooseState extends State<WebCreateChoose> {
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
                  "Choose One To Create",
                  style: TextStyle(
                    wordSpacing: 5,
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
                "Choose One To Create",
                style: const TextStyle(
                  wordSpacing: 5,
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("./assets/heroes/background/my_hero_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(0),
          children: [
            Container(
              height: screenSize.height,
              width: screenSize.height,
              child: Wrap(
                direction: Axis.vertical,
                runAlignment: WrapAlignment.spaceAround,
                alignment: WrapAlignment.spaceAround,
                children: [
                  VillainCover(),
                  HeroCover(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
