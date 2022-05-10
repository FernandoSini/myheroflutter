import 'dart:convert';

class VillainModel {
  String? trueName;
  String? lastName;
  String? villainName;
  int? villainRank;
  int? age;
  List<String>? images;

  VillainModel(
      {this.trueName,
      this.lastName,
      this.villainName,
      this.villainRank,
      this.age});

  VillainModel.fromJson(Map<String, dynamic> json) {
    trueName = json["trueName"];
    lastName = json["lastName"];
    villainName = json["villainName"];
    villainRank = json["villainRank"] != null
        ? int.tryParse(json["villainRank"].toString())
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
    data["heroName"] = villainName;
    data["heroRank"] = villainRank;
    data["age"] = age;
    data["images"] = images?.toList();
    return data;
  }

  static List<VillainModel> parseJsonToList(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<VillainModel>((json) => VillainModel.fromJson(json))
        .toList();
  }

  static String parseListToJson(List<VillainModel> villainList) {
    return jsonEncode(villainList.map((e) => e.toJson()).toList());
  }
}
