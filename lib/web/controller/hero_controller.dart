import 'package:flutter/cupertino.dart';
import 'package:my_hero_academia/web/models/Hero.dart';
import 'package:my_hero_academia/web/service/hero_service.dart';

class ControllerHero {
  HeroService? _heroService;

  ControllerHero({this.context}) {
    _heroService = HeroService();
  }

  final BuildContext? context;

  /* Future<HeroModel> findHeroByName(String heroName) async {
    var data = await _heroService?.fetchHeroByName(heroName);
    var heroModel = HeroModel.parseJsonToList(data!).toList().singleWhere((element) => element.heroName?.toLowerCase() == heroName);

    return heroModel;
  } */
  Future<HeroModel> findHeroByName(String heroName) async {
    var data = await _heroService?.findHeroByName(heroName);
    HeroModel heroModel = HeroModel.fromJson(data!);

    return heroModel;
  }
}
