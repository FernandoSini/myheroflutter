import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:my_hero_academia/web/controller/hero_controller.dart';
import 'package:my_hero_academia/web/ui/widgets/custom_scroll_bar.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../models/Hero.dart';
import '../../../utils/captilize_string.dart';

class WebVillainDetailScreen extends StatefulWidget {
  /*  const WebHeroDetailScreen({Key? key, @PathParam('heroName') this.heroName})
      : super(key: key);
  final String? heroName; */
  const WebVillainDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WebVillainDetailScreen> createState() => _WebVillainDetailScreenState();
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

class _WebVillainDetailScreenState extends State<WebVillainDetailScreen>
    with SingleTickerProviderStateMixin {
  var params = QR.params["villainName"].toString().toLowerCase();
  HeroModel? hero;
  ControllerHero? heroiController;

  @override
  void initState() {
    heroiController = ControllerHero(context: context);
    super.initState();
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
              //  width: screenSize.width * 0.5,
              )
        ],
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
        title: null,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: params.isNotEmpty && heroColor[params] != null
              ? Color(heroColor[params]!)
              : Colors.red,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              "./assets/heroes/background/all-might-background.png",
              isAntiAlias: true,
              fit: BoxFit.fitHeight,
              height: screenSize.height,
            ).image,
            colorFilter: ColorFilter.mode(
              params.isNotEmpty && heroColor[params] != null
                  ? Color(heroColor[params]!).withOpacity(0.5)
                  : Colors.red,
              BlendMode.darken,
            ),
          ),
        ),
        height: screenSize.height,
        width: screenSize.width,
        child: CustomScrollBar(
          //floatingBar: const FloatingBar(),
          alignmentDirection: Alignment.centerLeft,
          scrollController: ScrollController(),
          widgetToScroll: ListView(
            padding: const EdgeInsets.all(0),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              FutureBuilder(
                future: Future.delayed(Duration(seconds: 5), () {
                  return heroiController!.findHeroByName(params.toLowerCase());
                }),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      height: screenSize.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 200,
                              child: LoadingIndicator(
                                strokeWidth: 5,
                                indicatorType: Indicator.ballClipRotateMultiple,
                                colors: [
                                  Colors.yellow,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.data == null ||
                      !snapshot.hasData ||
                      snapshot.hasError) {
                    return SizedBox(
                      child: Center(child: Text(snapshot.error!.toString())),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData &&
                      snapshot.data != null &&
                      !snapshot.hasError) {
                    hero = snapshot.data as HeroModel;

                    return SizedBox(
                      height: screenSize.height,
                      width: screenSize.width,
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 100,
                                    ),
                                    Stack(
                                      children: <Widget>[
                                        // Stroked text as border.
                                        Container(
                                          child: Text(
                                            hero!.heroRank != null
                                                ? "#${hero!.heroRank!}"
                                                : "# ??",
                                            style: TextStyle(
                                              wordSpacing: 20,
                                              fontFamily: 'MyHeroFont',
                                              fontSize: 70,
                                              foreground: Paint()
                                                ..style = PaintingStyle.stroke
                                                ..strokeWidth = 10
                                                ..color = Colors.black,
                                            ),
                                          ),
                                        ),
                                        // Solid text as fill.
                                        Text(
                                          hero!.heroRank != null
                                              ? "#${hero!.heroRank!}"
                                              : "# ??",
                                          style: const TextStyle(
                                            wordSpacing: 20,
                                            fontFamily: 'MyHeroFont',
                                            fontSize: 70,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Stack(
                                      children: <Widget>[
                                        // Stroked text as border.
                                        Container(
                                          child: Text(
                                            hero!.trueName!.toString(),
                                            style: TextStyle(
                                              wordSpacing: 20,
                                              fontFamily: 'MyHeroFont',
                                              fontSize: 70,
                                              foreground: Paint()
                                                ..style = PaintingStyle.stroke
                                                ..strokeWidth = 10
                                                ..color = Colors.black,
                                            ),
                                          ),
                                        ),
                                        // Solid text as fill.
                                        Text(
                                          hero!.trueName!.toString(),
                                          style: const TextStyle(
                                            wordSpacing: 20,
                                            fontFamily: 'MyHeroFont',
                                            fontSize: 70,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      color: Colors.transparent,
                                      child: Stack(
                                        children: <Widget>[
                                          // Stroked text as border.
                                          Text(
                                            " ${hero!.lastName!}",
                                            style: TextStyle(
                                              wordSpacing: 0,
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
                                            " ${hero!.lastName!}",
                                            style: const TextStyle(
                                              wordSpacing: 20,
                                              fontFamily: 'MyHeroFont',
                                              fontSize: 70,
                                              color: Colors.yellow,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      color: Colors.transparent,
                                      child: Stack(
                                        children: <Widget>[
                                          // Stroked text as border.
                                          Container(
                                            color: Colors.transparent,
                                            child: Text(
                                              hero?.age != null
                                                  ? "age: ${hero!.age.toString()}"
                                                  : "??",
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
                                          ),
                                          // Solid text as fill.
                                          Text(
                                            hero?.age != null
                                                ? "age: ${hero!.age.toString()}"
                                                : "??",
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                          /* PageView(
                            scrollDirection: Axis.horizontal,
                            children: hero!.images!
                                .map(
                                  (e) => Image.asset(
                                    "assets/$e",
                                    fit: BoxFit.fitHeight,
                                  ),
                                )
                                .toList(),
                          ), */
                          PageView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/heroes/background/all-might2.jpg",
                                  height: 600,
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Stack(
                              children: <Widget>[
                                // Stroked text as border.
                                Container(
                                  color: Colors.transparent,
                                  child: Text(
                                    hero!.heroName!.capitalize(),
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
                                  hero!.heroName!.capitalize(),
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
