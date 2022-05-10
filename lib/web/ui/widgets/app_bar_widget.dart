import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  List<bool> onHoverList = List<bool>.filled(3, false);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      leadingWidth: 300,
      actions: [
        SizedBox(
            // width: screenSize.width * 0.5,
            )
      ],
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
            height: 250,
            width: 250,
          ),
        ),
      ),
      centerTitle: true,
      title: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: 20,
        children: [
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              onHover: (hover) {
                setState(() {
                  onHoverList[0] = hover;
                });
              },
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                QR.to("/heroes");
              },
              child: Container(
                child: Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Container(
                      color: Colors.transparent,
                      child: Text(
                        "Heroes",
                        style: TextStyle(
                          wordSpacing: 20,
                          fontFamily: 'MyHeroFont',
                          fontSize: 30,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 5
                            ..color =
                                !onHoverList[0] ? Colors.black : Colors.red,
                        ),
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      "Heroes",
                      style: const TextStyle(
                        wordSpacing: 20,
                        fontFamily: 'MyHeroFont',
                        fontSize: 30,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              onHover: (hover) {
                setState(() {
                  onHoverList[1] = hover;
                });
              },
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                QR.to("/villains");
              },
              child: Container(
                child: Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Container(
                      color: Colors.transparent,
                      child: Text(
                        "Villains",
                        style: TextStyle(
                          wordSpacing: 20,
                          fontFamily: 'MyHeroFont',
                          fontSize: 30,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 5
                            ..color =
                                !onHoverList[1] ? Colors.black : Colors.red,
                        ),
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      "Villains",
                      style: const TextStyle(
                        wordSpacing: 20,
                        fontFamily: 'MyHeroFont',
                        fontSize: 30,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Stack(
              children: <Widget>[
                // Stroked text as border.
                Container(
                  color: Colors.transparent,
                  child: Text(
                    "Heroes",
                    style: TextStyle(
                      wordSpacing: 20,
                      fontFamily: 'MyHeroFont',
                      fontSize: 30,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 5
                        ..color = Colors.black,
                    ),
                  ),
                ),
                // Solid text as fill.
                Text(
                  "Heroes",
                  style: const TextStyle(
                    wordSpacing: 20,
                    fontFamily: 'MyHeroFont',
                    fontSize: 30,
                    color: Colors.yellow,
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
