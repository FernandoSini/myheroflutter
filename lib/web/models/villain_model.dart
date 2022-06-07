import 'dart:convert';

import 'package:my_hero_academia/web/models/villain_thumbnail.dart';

class VillainModel {
  String? id;
  String? trueName;
  String? lastName;
  String? villainName;
  int? villainRank;
  int? age;
  List<String>? images;
  VillainThumbnail? villainThumbnail;

  VillainModel(
      {this.id,
      this.trueName,
      this.lastName,
      this.villainName,
      this.villainRank,
      this.age,
      this.villainThumbnail});

  VillainModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] != null ? json["id"] : null;
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
    villainThumbnail = json["villainThumbnail"] != null
        ? VillainThumbnail.fromJson(json["villainThumbnail"])
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
    if (villainName != null) {
      data["villainName"] = villainName;
    }
    if (villainRank != null && villainRank! > 0) {
      data["villainRank"] = villainRank;
    }
    if (age != null && villainRank! > 0) {
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
    if (villainName != null) {
      data["villainName"] = villainName!;
    }
    if (villainRank != null && villainRank! > 0) {
      data["villainRank"] = villainRank.toString();
    } else {
      data["villlainRank"] = 0.toString();
    }
    if (age != null && villainRank! > 0) {
      data["age"] = age.toString();
    }
    if (images != null) {
      data["images"] = images!.toList().toString();
    }
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
