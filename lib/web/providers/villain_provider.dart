import 'package:flutter/material.dart';

import '../models/villain_model.dart';

class VillainProvider extends ChangeNotifier {
  String? trueNameText;
  String? get trueName => trueNameText;
  String? lastNameText;
  String? get lastName => lastNameText;
  String? villainNameText;
  String? get villainName => villainNameText;
  int? villainRankValue;
  int? get villainRank => villainRankValue;
  int? villainAgeValue;
  int? get villainAge => villainAgeValue;
  bool? loading = false;
  bool? get isLoading => loading;

  void setIsLoading(bool? newValue) {
    loading = newValue;
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

  void setVillainName(String? newVillainName) {
    villainNameText = newVillainName;
    notifyListeners();
  }

  void setVillainRank(int? newVillainRank) {
    villainRankValue = newVillainRank;
    notifyListeners();
  }

  void setVillainAge(int? newVillainAge) {
    villainAgeValue = newVillainAge;
    notifyListeners();
  }

  VillainModel? sendVillainInfoToAPI() {
    VillainModel? villain = VillainModel(
        trueName: trueName ?? "",
        lastName: lastName ?? "",
        villainName: villainName ?? "",
        villainRank: villainRank ?? 0,
        age: villainAge ?? 0);

    return villain;
  }

  VillainModel? villain;
  void setVillain(VillainModel? newVillain) {
    if (newVillain != null) {
      villain = newVillain;
      notifyListeners();
    } else {
      villain = VillainModel();
      notifyListeners();
    }
  }

  clearForm() {
    setTrueName(null);
    setLastName(null);
    setIsLoading(false);
    setVillainName(null);
    setVillainRank(null);
    setVillainAge(null);
  }

  clearVillain() {
    setVillain(null);
  }

  clearAll() {
    clearVillain();
    clearForm();
  }
}
