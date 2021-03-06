import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:my_hero_academia/web/controller/hero_controller.dart';
import 'package:my_hero_academia/web/models/hero.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../widgets/hero_tumbnail_widget.dart';

class WebHeroesScreen extends StatefulWidget {
  const WebHeroesScreen({Key? key}) : super(key: key);

  @override
  State<WebHeroesScreen> createState() => _WebHeroesScreenState();
}

class _WebHeroesScreenState extends State<WebHeroesScreen> {
  ControllerHero? heroController;
  @override
  void initState() {
    heroController = ControllerHero(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xff1418FA),
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
                  "Heroes",
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
                "Heroes",
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "./assets/heroes/background/my-hero-academia-heroes-background.png",
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.blueGrey,
              BlendMode.multiply,
            ),
          ),
        ),
        child: FutureBuilder(
          future: Future.delayed(Duration(seconds: 5), () {
            return heroController?.fetchAllHeroes();
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: screenSize.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "./assets/heroes/background/my-hero-academia-heroes-background.png",
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.blueGrey,
                      BlendMode.multiply,
                    ),
                  ),
                ),
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
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data == null ||
                !snapshot.hasData ||
                snapshot.hasError) {
              return SizedBox(
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
                          fontSize: 50,
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
                          fontSize: 50,
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
              List<HeroModel>? heroList = snapshot.data as List<HeroModel>;

              return ListView(
                children: [
                  Container(
                    height: screenSize.height * 0.8,
                    width: screenSize.width,
                    //color: Colors.blue,

                    child: GridView.extent(
                      shrinkWrap: true,
                      maxCrossAxisExtent: 150,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 20,
                      padding: EdgeInsets.only(top: 50, left: 50, right: 50),
                      children: heroList
                          .map(
                            (e) => HeroThumbnailWidget(
                              hero: e,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
