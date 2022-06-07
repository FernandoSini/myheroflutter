import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:my_hero_academia/web/models/villain_model.dart';
import 'package:my_hero_academia/web/providers/villain_provider.dart';
import 'package:provider/provider.dart';
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
      return Future.error(response?["errorContent"]);
    }
  }

  Future<void> createVillain(
      VillainModel villain, Map<String, dynamic>? fileToUpload) async {
    VillainProvider provider = context!.read<VillainProvider>();

    provider.setIsLoading(true);
    //verifiying if villain was created
    final serviceResponse =
        await _villainService?.createVillain(villain, fileToUpload);

    if (serviceResponse?["statusCode"] >= 200 &&
        serviceResponse?["statusCode"] <= 299) {
      Future.delayed(Duration(seconds: 5), () => provider.setIsLoading(false));
    } else {
      Future.delayed(Duration(seconds: 5), () => provider.setIsLoading(false));
      Future.error(serviceResponse?["errorContent"]);
    }
  }
}
