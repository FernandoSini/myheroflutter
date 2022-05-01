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
    trueName = json["trueName"] != null ? json["trueName"] : null;
    lastName = json["lastName"] != null ? json["lastName"] : null;
    heroName = json["heroName"] != null ? json["heroName"] : null;
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
    data["trueName"] = this.trueName;
    data["lastName"] = this.lastName;
    data["heroName"] = this.heroName;
    data["heroRank"] = this.heroRank;
    data["age"] = this.age;
    data["images"] = this.images?.toList();
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
