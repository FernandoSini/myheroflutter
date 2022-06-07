class HeroThumbnail {
  String? id;
  String? content;
  String? idHeroRef;

  HeroThumbnail({this.id, this.content, this.idHeroRef});

  HeroThumbnail.fromJson(Map<String, dynamic> json) {
    id = json["id"] != null ? json["id"] : null;
    content = json["content"];
    idHeroRef = json["idHeroRef"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) {
      data["id"] = id;
    }
    if (content != null) {
      data["content"] = content;
    }
    if (idHeroRef != null) {
      data["idHeroRef"] = idHeroRef;
    }

    return data;
  }
}
