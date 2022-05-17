import 'package:flutter/material.dart';
import 'package:my_hero_academia/web/models/Hero.dart';

class HeroProvider extends ChangeNotifier {
  String? trueNameText;
  String? get trueName => trueNameText;
  String? lastNameText;
  String? get lastName => lastNameText;
  String? heroNameText;
  String? get heroName => heroNameText;
  int? heroRankValue;
  int? get heroRank => heroRankValue;
  int? heroAgeValue;
  int? get heroAge => heroAgeValue;
  bool? creatingHero = false;
  bool? get isHeroCreated => creatingHero;

  void setHeroCreated(bool? newValue) {
    creatingHero = newValue;
    notifyListeners();
  }

  void setTrueName(String? newTrueName) {
    trueNameText = newTrueName;
    notifyListeners();
  }

  void setLastName(String? newLastName) {
    lastNameText = newLastName;
    notifyListeners();
  }

  void setHeroName(String? newHeroName) {
    heroNameText = newHeroName;
    notifyListeners();
  }

  void setHeroRank(int? newHeroRank) {
    heroRankValue = newHeroRank;
    notifyListeners();
  }

  void setHeroAge(int? newHeroAge) {
    heroAgeValue = newHeroAge;
    notifyListeners();
  }

  Map<String, dynamic>? sendHeroInfoToAPI() {
    HeroModel heroInfo = HeroModel(
        trueName: trueName ?? "",
        lastName: lastName ?? "",
        heroName: heroName ?? "",
        heroRank: heroRank ?? 0,
        age: heroAge ?? 0);

    return heroInfo.toJson();
  }

  HeroModel? hero;
  void setHero(HeroModel? newHero) {
    if (newHero != null) {
      hero = newHero;
      notifyListeners();
    } else {
      hero = HeroModel();
      notifyListeners();
    }
  }

  clearForm() {
    setTrueName(null);
    setLastName(null);
    setHeroName(null);
    setHeroCreated(false);
    setHeroRank(null);
    setHeroAge(null);
  }

  clearHero() {
    setHero(null);
    setHeroCreated(false);
  }

  clearAll() {
    clearHero();
    clearForm();
  }
}
