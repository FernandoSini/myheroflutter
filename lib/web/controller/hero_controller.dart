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
  Future<HeroModel?> findHeroByName(String heroName) async {
    var response = await _heroService?.findHeroByName(heroName);
    if (response?["statusCode"] >= 200 && response?["statusCode"] <= 299) {
      HeroModel? heroModel = HeroModel.fromJson(response!["content"]);

      return heroModel;
    } else {
      return Future.error(response?["errorContent"]);
    }
  }

  Future<List<HeroModel>?> fetchAllHeroes() async {
    var response = await _heroService?.getAllHeroes();
    if (response?["statusCode"] >= 200 && response?["statusCode"] <= 299) {
      List<HeroModel>? heroes =
          HeroModel.parseJsonToList(response!["content"]).toList();

      return heroes;
    } else {
      return Future.error(response?["errorContent"]);
    }
  }
}
