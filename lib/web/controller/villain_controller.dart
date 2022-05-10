import 'package:flutter/cupertino.dart';
import 'package:my_hero_academia/web/models/Hero.dart';
import 'package:my_hero_academia/web/models/VillainModel.dart';
import 'package:my_hero_academia/web/service/hero_service.dart';

import '../service/villain_service.dart';

class VillainController {
  VillainService? _villainService;

  VillainController({this.context}) {
    _villainService = VillainService();
  }

  final BuildContext? context;

  /* Future<HeroModel> findHeroByName(String heroName) async {
    var data = await _heroService?.fetchHeroByName(heroName);
    var heroModel = HeroModel.parseJsonToList(data!).toList().singleWhere((element) => element.heroName?.toLowerCase() == heroName);

    return heroModel;
  } */
  Future<VillainModel?> findVillainByName(String villainName) async {
    var response = await _villainService?.findVillainByName(villainName);
    if (response?["statusCode"] >= 200 && response?["statusCode"] <= 299) {
      VillainModel? villain = VillainModel.fromJson(response!["content"]);

      return villain;
    } else {
      return Future.error(response?["errorContent"]);
    }
  }

  Future<List<VillainModel>?> fetchAllVillains() async {
    var response = await _villainService?.getAllVillains();

    if (response?["statusCode"] >= 200 && response?["statusCode"] <= 299) {
      List<VillainModel>? villains =
          VillainModel.parseJsonToList(response!["content"]).toList();

      return villains;
    } else {
      print(response);
      return Future.error(response?["errorContent"]);
    }
  }
}
