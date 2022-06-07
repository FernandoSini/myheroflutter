import 'package:flutter/material.dart';
import 'package:my_hero_academia/web/models/hero.dart';
import 'package:qlevar_router/qlevar_router.dart';

class HeroThumbnailWidget extends StatefulWidget {
  const HeroThumbnailWidget({Key? key, this.hero}) : super(key: key);
  final HeroModel? hero;

  @override
  State<HeroThumbnailWidget> createState() => _HeroThumbnailWidgetState();
}

class _HeroThumbnailWidgetState extends State<HeroThumbnailWidget> {
  Map<String?, int> heroColor = {
    "Deku".toLowerCase(): Color(0xff019E0B).value,
    "All-might".toLowerCase(): Colors.yellow.value,
    "Iida".toLowerCase(): Color(0xff1418FA).value,
    "Shoto": Colors.white.value,
    "Dynamight": Colors.orangeAccent.value,
  };
  bool onHover = false;
  @override
  Widget build(BuildContext context) {
    print(widget.hero?.heroThumbnail?.toJson());
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      onHover: (hover) {
        setState(() {
          onHover = hover;
        });
      },
      onTap: () {
        QR.toName(
          "HeroDetails",
          params: {'heroName': widget.hero!.heroName},
        );
      },
      child: Container(
        height: screenSize.height * 0.15,
        width: screenSize.width * 0.09,
        decoration: BoxDecoration(
          image: widget.hero!.heroThumbnail != null
              ? DecorationImage(
                  image: NetworkImage(widget.hero!.heroThumbnail!.content!),
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 12,
            color: !onHover || heroColor[widget.hero!.heroName] == null
                ? Colors.black
                : Color(heroColor[widget.hero!.heroName]!),
          ),
        ),
      ),
    );
  }
}
