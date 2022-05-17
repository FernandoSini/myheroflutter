import 'package:my_hero_academia/web/ui/screens/create/web_create_choose.dart';
import 'package:my_hero_academia/web/ui/screens/create/web_create_villain_screen.dart';
import 'package:my_hero_academia/web/ui/screens/create/web_create_hero_screen.dart';
import 'package:my_hero_academia/web/ui/screens/error/web_error_screen.dart';
import 'package:my_hero_academia/web/ui/screens/heroes/web_hero_detail_screen.dart';
import 'package:my_hero_academia/web/ui/screens/heroes/web_heroes_screen.dart';
import 'package:my_hero_academia/web/ui/screens/home/web_home_screen.dart';
import 'package:my_hero_academia/web/ui/screens/villains/web_villain_detail_screen.dart';
import 'package:my_hero_academia/web/ui/screens/villains/web_villains_screen.dart';
import 'package:qlevar_router/qlevar_router.dart';

class AppRoutes {
  /* void setup() {
    // enable debug logging for all routes
    QR.settings.enableDebugLog = true;
    
    // you can set your own logger
    // QR.settings.logger = (String message) {
    //   print(message);
    // };

    // Set up the not found route in your app.
    // this route (path and view) will be used when the user navigates to a
    // route that does not exist.
    QR.settings.notFoundPage = QRoute(
      path: 'path',
      builder: () => WebErrorScreen(),
    );

    // add observers to the app
    // this observer will be called when the user navigates to new route
    QR.observer.onNavigate.add((path, route) async {
      print('Observer: Navigating to $path');
    });

    // this observer will be called when the popped out from a route
    QR.observer.onPop.add((path, route) async {
      print('Observer: popping out from $path');
    });

    // create initial route that will be used when the app is started
    // or when route is waiting for response
    //QR.settings.iniPage = InitPage();

    // Change the page transition for all routes in your app.
    QR.settings.pagesType = QFadePage();
  } */

  final routes = [
    QRoute(
      name: 'home',
      path: '/',
      builder: () => WebHomeScreen(),
      pageType: QFadePage(
        opaque: true,
        transitionDurationMilliseconds: 1000,
      ),
    ),
    QRoute(
      name: 'home',
      path: '/home',
      builder: () => WebHomeScreen(),
      pageType: QFadePage(
        opaque: true,
        transitionDurationMilliseconds: 1000,
      ),
    ),
    QRoute(
      name: "hero",
      path: '/heroes',
      builder: () => WebHeroesScreen(),
      pageType: QFadePage(
        opaque: true,
        transitionDurationMilliseconds: 1000,
      ),
      children: [
        QRoute.withChild(
          name: 'Details',
          path: '/details',
          builderChild: (r) => WebHeroDetailScreen(),
          pageType: QFadePage(
            opaque: true,
            transitionDurationMilliseconds: 1000,
          ),
          children: [
            QRoute(
              name: "HeroDetails",
              path: "/:heroName",
              builder: () => WebHeroDetailScreen(),
              pageType: QFadePage(
                opaque: true,
                transitionDurationMilliseconds: 1000,
              ),
              middleware: [
                QMiddlewareBuilder(
                    /* redirectGuardFunc: (s) {
                      print("rota aqui" + s);
                      return Future.delayed(
                          Duration(
                            seconds: 5,
                          ), () {
                        return "/error";
                      });
                    }, */
                    /*   redirectGuardNameFunc: (s) {
                      print(s);
                      return Future.delayed(
                          Duration(
                            seconds: 0,
                          ), () {
                        return QNameRedirect(name: "/heroes");
                      });
                    }, */
                    ),
              ],
            ),
          ],
        ),
      ],
    ),

    QRoute(
      name: "villains",
      path: '/villains',
      builder: () => WebVillainsScreen(),
      pageType: QFadePage(
        opaque: true,
        transitionDurationMilliseconds: 1000,
      ),
      children: [
        QRoute.withChild(
          name: 'Details',
          path: '/details',
          builderChild: (r) => WebVillainDetailScreen(),
          pageType: QFadePage(
            opaque: true,
            transitionDurationMilliseconds: 1000,
          ),
          children: [
            QRoute(
              name: "VillainDetails",
              path: "/:villainName",
              builder: () => WebVillainDetailScreen(),
              pageType: QFadePage(
                opaque: true,
                transitionDurationMilliseconds: 1000,
              ),
              middleware: [],
            ),
          ],
        ),
      ],
    ),
    QRoute(
      name: "Create",
      path: '/create',
      builder: () => WebCreateChoose(),
      pageType: QFadePage(
        opaque: true,
        transitionDurationMilliseconds: 1000,
      ),
      children: [
        QRoute(
          name: 'CreateHero',
          path: '/hero',
          builder: () => WebCreateHeroScreen(),
          pageType: QFadePage(
            opaque: true,
            transitionDurationMilliseconds: 1000,
          ),
        ),
        QRoute(
          name: "CreateVillain",
          path: "/villain",
          builder: () => WebCreateVillainScreen(),
          pageType: QFadePage(
            opaque: true,
            transitionDurationMilliseconds: 1000,
          ),
          middleware: [],
        ),
      ],
    ),
    QRoute(
      path: "/error",
      name: "error",
      builder: () => WebErrorScreen(),
      pageType: QFadePage(
        transitionDurationMilliseconds: 1000,
      ),
    ),

    // QRoute(path: '/products/:category(\w)', builder: () => ProductCategory()),
    // QRoute(path: '/products/:id((^[0-9]\$))', builder: () => ProductDetails()),
    // QRoute(path: "/erro", builder: () => WebErrorScreen(), )
  ];
}
