// /* import 'package:auto_route/auto_route.dart';
// import 'package:my_hero_academia/web/routes/web_routes.dart';
// import 'package:my_hero_academia/web/ui/screens/error/web_error_screen.dart';
// import 'package:my_hero_academia/web/ui/screens/heroes/web_heroes_screen.dart';
// import 'package:my_hero_academia/web/ui/screens/home/web_home_screen.dart';
// import 'package:my_hero_academia/web/ui/screens/heroes/web_hero_detail_screen.dart';

// @MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
//   CustomRoute(
//       initial: true,
//       path: WebRoutes.home,
//       page: WebHomeScreen,
//       transitionsBuilder: TransitionsBuilders.fadeIn),
//   CustomRoute(
//     path: WebRoutes.heroes,
//     page: WebHeroesScreen,
//     name: "Heroes",
//     /* children: [
//       CustomRoute(
//         page: WebHeroDetailScreen,
//         path: "details/:heroName",
//         transitionsBuilder: TransitionsBuilders.fadeIn,
//       ),
//       RedirectRoute(
//         path: "*",
//         redirectTo: WebRoutes.error,
//       ),
//     ],*/
//     transitionsBuilder: TransitionsBuilders.fadeIn,
//   ),
//   CustomRoute(
//       path: WebRoutes.heroes + WebRoutes.heroDetail,
//       page: WebHeroDetailScreen,
//       children: [RedirectRoute(path: '*', redirectTo: WebRoutes.error)]),
//   CustomRoute(path: WebRoutes.error, page: WebErrorScreen),
//   RedirectRoute(path: "*", redirectTo: WebRoutes.error),
// ])
// class $FlutterRouter {} */

// import 'package:auto_route/auto_route.dart';
// import 'package:my_hero_academia/web/routes/web_routes.dart';
// import 'package:my_hero_academia/web/ui/screens/error/web_error_screen.dart';
// import 'package:my_hero_academia/web/ui/screens/heroes/web_heroes_screen.dart';
// import 'package:my_hero_academia/web/ui/screens/home/web_home_screen.dart';
// import 'package:my_hero_academia/web/ui/screens/heroes/web_hero_detail_screen.dart';

// @AdaptiveAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
//   CustomRoute(
//       initial: true,
//       path: "/",
//       page: WebHomeScreen,
//       transitionsBuilder: TransitionsBuilders.fadeIn),
//   CustomRoute(
//     path: WebRoutes.heroes,
//     page: WebHeroesScreen,
//     name: "Heroes",
//     transitionsBuilder: TransitionsBuilders.fadeIn,
//   ),
//   CustomRoute(
//     path: WebRoutes.heroes + WebRoutes.heroDetail,
//     page: WebHeroDetailScreen,
//     transitionsBuilder: TransitionsBuilders.fadeIn,
//     children: [
//       RedirectRoute(path: "*", redirectTo: WebRoutes.error),
//     ],
//   ),
//   RedirectRoute(
//       path: WebRoutes.heroes + WebRoutes.heroDetail + "/*",
//       redirectTo: WebRoutes.error),
//   RedirectRoute(path: "/heroes/details/*", redirectTo: WebRoutes.error),
//   RedirectRoute(path: "/heroes/*", redirectTo: WebRoutes.error),
//   CustomRoute(
//       path: WebRoutes.error,
//       page: WebErrorScreen,
//       transitionsBuilder: TransitionsBuilders.fadeIn),
//   RedirectRoute(path: "/home", redirectTo: "/"),
//   RedirectRoute(path: "*", redirectTo: WebRoutes.error),
// ])
// class $FlutterRouter {}

// import 'package:auto_route/auto_route.dart';
// import 'package:my_hero_academia/web/routes/web_routes.dart';

// import '../ui/screens/error/web_error_screen.dart';
// import '../ui/screens/heroes/web_hero_detail_screen.dart';
// import '../ui/screens/heroes/web_heroes_screen.dart';
// import '../ui/screens/heroes/web_heroes_wrapper.dart';
// import '../ui/screens/home/web_home_screen.dart';

// @AdaptiveAutoRouter(
//   replaceInRouteName: 'Page,Route',
//   routes: <AutoRoute>[
//     CustomRoute(
//       initial: true,
//       path: "/",
//       page: WebHomeScreen,
//       transitionsBuilder: TransitionsBuilders.fadeIn,
//     ),
//     CustomRoute(
//       path: WebRoutes.heroes,
//       page: WebHeroesWrapper,
//       children: [
//         CustomRoute(
//           page: WebHeroesScreen,
//           path: '',
//         ),
//         CustomRoute(
//           page: WebHeroDetailScreen,
//           path: WebRoutes.heroDetail,
//           transitionsBuilder: TransitionsBuilders.fadeIn,
//           children: [
//             CustomRoute(
//               page: WebErrorScreen,
//               path: '*',
//             ),
//             RedirectRoute(
//               path: '*',
//               redirectTo: WebRoutes.error,
//             )
//           ],
//         ),
//         CustomRoute(
//           page: WebErrorScreen,
//           path: "*",
//           transitionsBuilder: TransitionsBuilders.fadeIn,
//         ),
//         RedirectRoute(
//           path: "",
//           redirectTo: WebRoutes.heroes,
//         ),
//         RedirectRoute(
//           path: '*',
//           redirectTo: WebRoutes.error,
//         )
//       ],
//     ),
//     RedirectRoute(
//       path: "/home",
//       redirectTo: "/",
//     ),
//     RedirectRoute(path: "/heroes/details/*", redirectTo: WebRoutes.error),
//     RedirectRoute(path: "/heroes/*", redirectTo: WebRoutes.error),
//     RedirectRoute(path: "*", redirectTo: WebRoutes.error),
//   ],
// )
// class $FlutterRouter {}
