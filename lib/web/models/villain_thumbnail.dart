class VillainThumbnail {
  String? id;
  String? content;
  String? idVillainRef;

  VillainThumbnail({this.id, this.content, this.idVillainRef});

  VillainThumbnail.fromJson(Map<String, dynamic> json) {
    id = json["id"] != null ? json["id"] : null;
    content = json["content"];
    idVillainRef = json["idVillainRef"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) {
      data["id"] = id;
    }
    if (content != null) {
      data["content"] = content;
    }
    if (idVillainRef != null) {
      data["idVillainRef"] = idVillainRef;
    }

    return data;
  }
}
