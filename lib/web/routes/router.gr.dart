// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:my_hero_academia/web/ui/screens/error/web_error_screen.dart'
    as _i4;
import 'package:my_hero_academia/web/ui/screens/heroes/web_hero_detail_screen.dart'
    as _i3;
import 'package:my_hero_academia/web/ui/screens/heroes/web_heroes_screen.dart'
    as _i2;
import 'package:my_hero_academia/web/ui/screens/home/web_home_screen.dart'
    as _i1;

class FlutterRouter extends _i5.RootStackRouter {
  FlutterRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    WebHomeScreen.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.WebHomeScreen(),
          transitionsBuilder: _i5.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    Heroes.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.WebHeroesScreen(),
          transitionsBuilder: _i5.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    WebHeroDetailScreen.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WebHeroDetailScreenArgs>(
          orElse: () => WebHeroDetailScreenArgs(
              heroName: pathParams.optString('heroName')));
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child:
              _i3.WebHeroDetailScreen(key: args.key, heroName: args.heroName),
          transitionsBuilder: _i5.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    WebErrorScreen.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.WebErrorScreen(),
          transitionsBuilder: _i5.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i5.RouteConfig(WebHomeScreen.name, path: '/home'),
        _i5.RouteConfig(Heroes.name, path: '/heroes'),
        _i5.RouteConfig(WebHeroDetailScreen.name,
            path: '/heroes/details/:heroName'),
        _i5.RouteConfig('/heroes/details/*#redirect',
            path: '/heroes/details/*', redirectTo: '/error', fullMatch: true),
        _i5.RouteConfig(WebErrorScreen.name, path: '/error'),
        _i5.RouteConfig('*#redirect',
            path: '*', redirectTo: '/error', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.WebHomeScreen]
class WebHomeScreen extends _i5.PageRouteInfo<void> {
  const WebHomeScreen() : super(WebHomeScreen.name, path: '/home');

  static const String name = 'WebHomeScreen';
}

/// generated route for
/// [_i2.WebHeroesScreen]
class Heroes extends _i5.PageRouteInfo<void> {
  const Heroes() : super(Heroes.name, path: '/heroes');

  static const String name = 'Heroes';
}

/// generated route for
/// [_i3.WebHeroDetailScreen]
class WebHeroDetailScreen extends _i5.PageRouteInfo<WebHeroDetailScreenArgs> {
  WebHeroDetailScreen({_i6.Key? key, String? heroName})
      : super(WebHeroDetailScreen.name,
            path: '/heroes/details/:heroName',
            args: WebHeroDetailScreenArgs(key: key, heroName: heroName),
            rawPathParams: {'heroName': heroName});

  static const String name = 'WebHeroDetailScreen';
}

class WebHeroDetailScreenArgs {
  const WebHeroDetailScreenArgs({this.key, this.heroName});

  final _i6.Key? key;

  final String? heroName;

  @override
  String toString() {
    return 'WebHeroDetailScreenArgs{key: $key, heroName: $heroName}';
  }
}

/// generated route for
/// [_i4.WebErrorScreen]
class WebErrorScreen extends _i5.PageRouteInfo<void> {
  const WebErrorScreen() : super(WebErrorScreen.name, path: '/error');

  static const String name = 'WebErrorScreen';
}
