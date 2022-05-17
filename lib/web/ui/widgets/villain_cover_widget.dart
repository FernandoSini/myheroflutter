import 'package:flutter/material.dart';
import 'package:my_hero_academia/web/utils/captilize_string.dart';
import 'package:qlevar_router/qlevar_router.dart';

class VillainCover extends StatefulWidget {
  const VillainCover({Key? key}) : super(key: key);

  @override
  State<VillainCover> createState() => _VillainCoverState();
}

class _VillainCoverState extends State<VillainCover> {
  bool onHover = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onHover: (hover) {
          setState(() {
            onHover = hover;
          });
        },
        onTap: () {
          QR.toName("CreateVillain");
        },
        child: Container(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "./assets/villains/all_for_one_flying.png",
                  height: 700,
                  color: !onHover ? null : Colors.red.withOpacity(0.5),
                  colorBlendMode: BlendMode.dstIn,
                  //fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    children: <Widget>[
                      // Stroked text as border.
                      Container(
                        color: Colors.transparent,
                        child: Text(
                          "Villain".capitalize(),
                          style: TextStyle(
                            wordSpacing: 20,
                            fontFamily: 'MyHeroFont',
                            fontSize: 150,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 20
                              ..color = !onHover ? Colors.black : Colors.red,
                          ),
                        ),
                      ),
                      // Solid text as fill.
                      Text(
                        "Villain".capitalize(),
                        style: const TextStyle(
                          wordSpacing: 20,
                          fontFamily: 'MyHeroFont',
                          fontSize: 150,
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
      ),
    );
  }
}
