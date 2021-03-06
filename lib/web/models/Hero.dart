import 'dart:convert';

import 'hero_thumbnail.dart';

class HeroModel {
  String? id;
  String? trueName;
  String? lastName;
  String? heroName;
  int? heroRank;
  int? age;
  List<String>? images;
  HeroThumbnail? heroThumbnail;

  HeroModel(
      {this.id,
      this.trueName,
      this.lastName,
      this.heroName,
      this.heroRank,
      this.age,
      this.heroThumbnail});

  HeroModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] != null ? json["id"] : null;
    trueName = json["trueName"];
    lastName = json["lastName"];
    heroName = json["heroName"];
    heroRank = json["heroRank"] != null
        ? int.tryParse(json["heroRank"].toString())
        : null;
    age = json["age"] != null ? int.tryParse(json["age"].toString()) : null;
    if (json['images'] != null) {
      images = <String>[];
      json['images'].forEach((v) {
        images?.add(v);
      });
    }
    heroThumbnail = json["heroThumbnail"] != null
        ? HeroThumbnail.fromJson(json["heroThumbnail"])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) {
      data["id"] = id;
    }
    if (trueName != null) {
      data["trueName"] = trueName;
    }
    if (lastName != null) {
      data["lastName"] = lastName;
    }
    if (heroName != null) {
      data["heroName"] = heroName;
    }
    if (heroRank != null && heroRank! > 0) {
      data["heroRank"] = heroRank;
    }
    if (age != null && age! > 0) {
      data["age"] = age;
    }
    if (images != null) {
      data["images"] = images?.toList();
    }
    return data;
  }

  Map<String, String> toJsonV2() {
    final Map<String, String> data = <String, String>{};
    if (id != null) {
      data["id"] = id!;
    }
    if (trueName != null) {
      data["trueName"] = trueName!;
    }
    if (lastName != null) {
      data["lastName"] = lastName!;
    }
    if (heroName != null) {
      data["heroName"] = heroName!;
    }
    if (heroRank != null && heroRank! > 0) {
      data["heroRank"] = heroRank.toString();
    } else {
      data["heroRank"] = 0.toString();
    }
    if (age != null && age! > 0) {
      data["age"] = age.toString();
    }
    if (images != null) {
      data["images"] = images!.toList().toString();
    }
    return data;
  }

  static List<HeroModel> parseJsonToList(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<HeroModel>((json) => HeroModel.fromJson(json)).toList();
  }

  static String parseListToJson(List<HeroModel> heroesList) {
    return jsonEncode(heroesList.map((e) => e.toJson()).toList());
  }
}
