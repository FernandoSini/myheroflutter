import 'dart:convert';

import 'package:my_hero_academia/web/data/db.dart';

import '../models/hero.dart';

class HeroRepository {
  Future<HeroModel?> readSingleHero() async {
    var jsonData = await DB.getByKey("hero");
    if (jsonData == null || jsonData == '') return null;
    return HeroModel.fromJson(jsonData);
  }

  Future<void> saveSingleHeroLocal(HeroModel heroModel) async {
    await DB.save(json.encode(heroModel.toJson()), "hero-${heroModel.id}");
  }

  Future<void> saveListHero(List<HeroModel> heroList) async {
    await DB.save(HeroModel.parseListToJson(heroList), "heroList");
  }

  Future<List<HeroModel>?> readHeroList() async {
    var jsonList = await DB.getByKey("heroList");
    if (jsonList == null || jsonList == '') return null;
    return HeroModel.parseJsonToList(jsonList);
  }
}
