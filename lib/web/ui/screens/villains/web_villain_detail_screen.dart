import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:my_hero_academia/web/controller/villain_controller.dart';
import 'package:my_hero_academia/web/models/VillainModel.dart';
import 'package:my_hero_academia/web/ui/widgets/custom_scroll_bar.dart';
import 'package:qlevar_router/qlevar_router.dart';

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
  VillainModel? villainModel;
  VillainController? villainController;
  bool onHover = false;
  Future<VillainModel?>? _villainFuture;
  @override
  void initState() {
    villainController = VillainController(context: context);
    _villainFuture = Future.delayed(Duration(seconds: 5), () {
      return villainController!.findVillainByName(params.toLowerCase());
    });
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
          Container(
            margin: EdgeInsets.only(right: 40, top: 25),
            child: Material(
              type: MaterialType.transparency,
              elevation: 0,
              child: InkWell(
                onTap: () {},
                onHover: (value) => setState(() {
                  onHover = value;
                }),
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Container(
                      color: Colors.transparent,
                      child: Text(
                        "Delete Villain",
                        style: TextStyle(
                          wordSpacing: 5,
                          fontFamily: 'MyHeroFont',
                          fontSize: 50,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 7
                            ..color = !onHover ? Colors.black : Colors.red,
                        ),
                      ),
                    ),

                    // Solid text as fill.
                    Text(
                      "Delete Villain",
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
          ),
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
                future: _villainFuture,
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
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: /* Text(
                    snapshot.error!.toString(),
                    style: TextStyle(color: Colors.white), */
                            Stack(
                          children: <Widget>[
                            // Stroked text as border.
                            Text(
                              snapshot.error!.toString(),
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
                              snapshot.error!.toString(),
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
                    );
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData &&
                      snapshot.data != null &&
                      !snapshot.hasError) {
                    villainModel = snapshot.data as VillainModel;

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
                                            villainModel!.villainRank != null
                                                ? "#${villainModel!.villainRank!}"
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
                                          villainModel!.villainRank != null
                                              ? "#${villainModel!.villainRank!}"
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
                                            villainModel!.trueName!.toString(),
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
                                          villainModel!.trueName!.toString(),
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
                                            " ${villainModel!.lastName!}",
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
                                            " ${villainModel!.lastName!}",
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
                                      child: BorderedText(
                                        strokeWidth: 10,
                                        strokeColor: Colors.black,
                                        // Stroked text as border.

                                        // Solid text as fill.
                                        child: Text(
                                          villainModel?.age != null
                                              ? "age: ${villainModel!.age.toString()}"
                                              : "??",
                                          style: const TextStyle(
                                            fontFamily: 'MyHeroFont',
                                            fontSize: 70,
                                            color: Colors.yellow,
                                          ),
                                        ),
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
                                    villainModel!.villainName!.capitalize(),
                                    style: TextStyle(
                                      wordSpacing: 20,
                                      fontFamily: 'MyHeroFont',
                                      fontSize: 120,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 20
                                        ..color = Colors.black,
                                    ),
                                  ),
                                ),
                                // Solid text as fill.
                                Text(
                                  villainModel!.villainName!.capitalize(),
                                  style: const TextStyle(
                                    wordSpacing: 20,
                                    fontFamily: 'MyHeroFont',
                                    fontSize: 120,
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
