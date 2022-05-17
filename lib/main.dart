import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_hero_academia/web/providers/hero_provider.dart';
import 'package:my_hero_academia/web/providers/villain_provider.dart';
import 'package:my_hero_academia/web/routes/app_routes.dart';
import 'package:my_hero_academia/web/ui/screens/error/web_error_screen.dart';
import 'package:my_hero_academia/web/ui/screens/home/web_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

void main() {
  runApp(
    kIsWeb ? MyAppWeb() : MyAppMobile(),
  );
}

void initDefaultConfig() {
  QR.settings.enableDebugLog = false;
  QR.settings.enableLog = false;
  QR.setUrlStrategy();
  QR.settings.iniPage = WebHomeScreen();
  QR.settings.notFoundPage = QRoute(
      path: "/error",
      name: "error",
      builder: () => WebErrorScreen(),
      pageType: QFadePage(
        transitionDurationMilliseconds: 1000,
      ));
}

class MyAppWeb extends StatelessWidget {
  MyAppWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initDefaultConfig();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((_) => HeroProvider()),
        ),
        ChangeNotifierProvider(
          create: ((_) => VillainProvider()),
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: QRouterDelegate(AppRoutes().routes, withWebBar: true),
        routeInformationParser: QRouteInformationParser(),
        debugShowCheckedModeBanner: false,
        title: 'My Hero Academia',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
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
