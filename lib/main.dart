import 'package:flutter/material.dart';
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
          _appRouter.defaultRouteParser(includePrefixMatches: true),
      debugShowCheckedModeBanner: false,
      title: 'My Hero Academia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
