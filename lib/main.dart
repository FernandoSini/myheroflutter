/* import 'package:flutter/material.dart';
import 'package:my_hero_academia/web/routes/router.gr.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = FlutterRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser:
          _appRouter.defaultRouteParser(includePrefixMatches: true,),
      debugShowCheckedModeBanner: false,
      title: 'My Hero Academia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_hero_academia/web/routes/app_routes.dart';
import 'package:my_hero_academia/web/ui/screens/error/web_error_screen.dart';
import 'package:my_hero_academia/web/ui/screens/home/web_home_screen.dart';
import 'package:qlevar_router/qlevar_router.dart';

void main() {
  runApp(
    kIsWeb ? MyAppWeb() : MyAppMobile(),
  );
}

class MyAppWeb extends StatelessWidget {
  MyAppWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QR.setUrlStrategy();
    QR.settings.iniPage = WebHomeScreen();
    QR.settings.notFoundPage = QRoute(
        path: "/error",
        name: "error",
        builder: () => WebErrorScreen(),
        pageType: QFadePage(
          transitionDurationMilliseconds: 1000,
        ));
    return MaterialApp.router(
      routerDelegate: QRouterDelegate(AppRoutes().routes, withWebBar: true),
      routeInformationParser: QRouteInformationParser(),
      debugShowCheckedModeBanner: false,
      title: 'My Hero Academia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyAppMobile extends StatelessWidget {
  MyAppMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Hero Academia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
