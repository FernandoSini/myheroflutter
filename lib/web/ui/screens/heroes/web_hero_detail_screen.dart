import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:my_hero_academia/web/controller/hero_controller.dart';
import 'package:my_hero_academia/web/routes/router.gr.dart';
import 'package:my_hero_academia/web/routes/web_routes.dart';
import 'package:my_hero_academia/web/ui/widgets/floating_bar.dart';
import 'package:my_hero_academia/web/ui/widgets/custom_scroll_bar.dart';

import '../../../models/Hero.dart';

class WebHeroDetailScreen extends StatefulWidget {
  const WebHeroDetailScreen({Key? key, @PathParam('heroName') this.heroName})
      : super(key: key);
  final String? heroName;

  @override
  State<WebHeroDetailScreen> createState() => _WebHeroDetailScreenState();
}

final Set<Color> colors = {
  ...Colors.primaries,
  ...Colors.accents,
  Colors.transparent,
  Colors.black,
  Colors.white
};
final Set<String> midoriyaImages = {
  "midoriya1.png",
  "midoriya2.png",
  "midoriya3.png",
  "midoriya4.png",
};

/*Map<String?, dynamic> heroColor = {
  "Deku".toLowerCase(): colors
      .toList()
      .singleWhere((element) => element.value == Colors.green.value),
  "All-might".toLowerCase(): colors
      .toList()
      .singleWhere((element) => element.value == Color(0xff1418FA).value),
  "Shoto".toLowerCase(): colors
      .toList()
      .singleWhere((element) => element.value == Colors.red.value),
  "Dynamight".toLowerCase(): colors
      .toList()
      .singleWhere((element) => element.value == Colors.orangeAccent.value),
};*/
Map<String?, int> heroColor = {
  "Deku".toLowerCase(): Color(0xff019E0B).value,
  "All-might".toLowerCase(): Colors.yellow.value,
  "Iida".toLowerCase(): Color(0xff1418FA).value,
  "Shoto": Colors.white.value,
  "Dynamight": Colors.orangeAccent.value,
};

class _WebHeroDetailScreenState extends State<WebHeroDetailScreen>
    with SingleTickerProviderStateMixin {
  HeroModel hero = HeroModel();
  ControllerHero? heroiController;

  @override
  void initState() {
    heroiController = ControllerHero(context: context);
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    if (widget.heroName != null && widget.heroName!.isNotEmpty) {
      /* hero = await heroiController!
          .findHeroByName(widget.heroName!)
          .then((value) => hero = value);*/
    } else {
      AutoRouter.of(context).replaceNamed(const WebErrorScreen().path);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      /* backgroundColor: widget.heroName != null
          ? Color(heroColor[widget.heroName]!)
          : Colors.red, */
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(
            width: screenSize.width * 0.5,
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Material(
              type: MaterialType.transparency,
              elevation: 0,
              child: InkWell(
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  AutoRouter.of(context).replaceNamed(WebRoutes.home);
                },
                child: Image.asset(
                  "assets/logo/my_hero_academia_logo.png",
                  isAntiAlias: true,
                  height: 250,
                  width: 250,
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                width: screenSize.width * 2,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: widget.heroName != null
              ? Color(heroColor[widget.heroName]!)
              : Colors.red,
          image: DecorationImage(
              image: Image.asset(
                "./assets/heroes/background/midoriya5.png",
                isAntiAlias: true,
                fit: BoxFit.cover,
              ).image,
              colorFilter: ColorFilter.mode(
                  widget.heroName != null
                      ? Color(heroColor[widget.heroName]!)
                      : Colors.red,
                  BlendMode.darken)),
        ),
        height: screenSize.height,
        width: screenSize.width,
        child: CustomScrollBar(
          floatingBar: const FloatingBar(),
          alignmentDirection: Alignment.centerLeft,
          scrollController: ScrollController(),
          widgetToScroll: ListView(
            padding: const EdgeInsets.all(0),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              FutureBuilder(
                future: heroiController!
                    .findHeroByName(widget.heroName!.toLowerCase()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                      height: 100,
                      width: 100,
                      child: LoadingIndicator(
                        indicatorType: Indicator.audioEqualizer,
                      ),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.data == null ||
                      !snapshot.hasData ||
                      snapshot.hasError) {
                    return SizedBox(
                      child: Text(snapshot.error!.toString()),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData &&
                      snapshot.data != null &&
                      !snapshot.hasError) {
                    hero = snapshot.data as HeroModel;
                    return SizedBox(
                      height: screenSize.height,
                      child: Stack(
                        children: [
                          /* PageView(
                            scrollDirection: Axis.horizontal,
                            children: hero.images!
                                .map(
                                  (e) => Image.asset(
                                    "assets/$e",
                                    fit: BoxFit.fitHeight,
                                  ),
                                )
                                .toList(),
                          ), */
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Stack(
                                children: <Widget>[
                                  // Stroked text as border.
                                  Container(
                                    child: Text(
                                      hero.heroName!,
                                      style: TextStyle(
                                        wordSpacing: 20,
                                        fontFamily: 'MyHeroFont',
                                        fontSize: 150,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 20
                                          ..color = Colors.black,
                                      ),
                                    ),
                                  ),
                                  // Solid text as fill.
                                  Text(
                                    hero.heroName!,
                                    style: const TextStyle(
                                      wordSpacing: 20,
                                      fontFamily: 'MyHeroFont',
                                      fontSize: 150,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
