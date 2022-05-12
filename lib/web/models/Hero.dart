import 'dart:convert';

class HeroModel {
  String? trueName;
  String? lastName;
  String? heroName;
  int? heroRank;
  int? age;
  List<String>? images;

  HeroModel(
      {this.trueName, this.lastName, this.heroName, this.heroRank, this.age});

  HeroModel.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["trueName"] = trueName;
    data["lastName"] = lastName;
    data["heroName"] = heroName;
    data["heroRank"] = heroRank;
    data["age"] = age;
    data["images"] = images?.toList();
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
