import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../routes/web_routes.dart';

class WebHomeScreen extends StatefulWidget {
  const WebHomeScreen({Key? key}) : super(key: key);

  @override
  State<WebHomeScreen> createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff1418FA),
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
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
      ),
    );
  }
}
