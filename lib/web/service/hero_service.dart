import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:my_hero_academia/web/models/hero.dart';
import 'package:my_hero_academia/web/service/default_service.dart';

class HeroService extends DefaultService {
  /* Future<String> fetchHeroByName(String heroName) async {
    /* Map<String, dynamic> heroesJson = {
      "trueName": "Izuku",
      "lastName": "Midoriya",
      "heroName": "Deku",
      "heroRank": 20,
      "age": 20,
      "images": [
        "heroes/midoriya1.png",
        "heroes/midoriya2.png",
        "heroes/midoriya3.png",
        "heroes/midoriya4.png"
      ]
    };
     */
    var heroesJson = [
      {
        "trueName": "Izuku",
        "lastName": "Midoriya",
        "heroName": "Deku",
        "heroRank": 20,
        "age": 20,
        "images": [
          "heroes/midoriya1.png",
          "heroes/midoriya2.png",
          "heroes/midoriya3.png",
          "heroes/midoriya4.png"
        ]
      },
      {
        "trueName": "Yagi",
        "lastName": "Toshinori",
        "heroName": "All-might",
        "heroRank": 01,
        "age": 49,
        "images": ["heroes/all-might.png"]
      }
    ];

    var encodedJson = json.encode(heroesJson);
    return encodedJson;
  } */

  Future<Map<String, dynamic>>? findHeroByName(String heroName) async {
    var url = "http://localhost:8080/heroes/$heroName";

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        var successResponse = {
          "statusCode": response.statusCode,
          "content": jsonDecode(
            const Utf8Decoder(allowMalformed: true).convert(response.bodyBytes),
          ),
        };
        return successResponse;
      } else {
        var erroBody = {
          "statusCode": response.statusCode,
          "errorContent": jsonDecode(response.body)["erro"]
        };

        return Future.error(erroBody);
      }
    } on Exception {
      return Future.error("Sorry, we have a problem with our servers!");
    }
  }

  Future<Map<String, dynamic>>? getAllHeroes() async {
    var url = "http://localhost:8080/heroes";

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        var successResponse = {
          "statusCode": response.statusCode,
          "content": const Utf8Decoder(allowMalformed: true)
              .convert(response.bodyBytes),
        };
        return successResponse;
      } else {
        var erroBody = {
          "statusCode": response.statusCode,
          "errorContent": jsonDecode(response.body)["erro"]
        };

        return erroBody;
      }
    } on Exception {
      return Future.error("Sorry, we have a problem with our servers!");
    }
  }

  /*  Future<Map<String, dynamic>>? createHero(HeroModel hero) async {
    String url = "http://localhost:8080/heroes/create";
    try {
      final response =
          await http.post(Uri.parse(url), body: json.encode(hero.toJson()));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        var successResponse = {
          "statusCode": response.statusCode,
          "content": const Utf8Decoder(allowMalformed: true)
              .convert(response.bodyBytes),
        };
        return successResponse;
      } else {
        var erroBody = {
          "statusCode": response.statusCode,
          "errorContent": jsonDecode(response.body)["erro"]
        };

        return erroBody;
      }
    } on Exception {
      return Future.error("Sorry, we have a problem with our servers!");
    }
  } */
  Future<Map<String, dynamic>>? createHero(
      HeroModel hero, Map<String, dynamic>? file) async {
    String url = "http://localhost:8080/heroes/create";
    try {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse(url),
      );
      Map<String, String> headers = {
        "Content-Type": "multipart/form-data",
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Methods": "GET, PUT, DELETE, POST, OPTIONS",
      };
      request.headers.addAll(headers);
      if (hero.toJsonV2().isNotEmpty) {
        request.fields.addAll(hero.toJsonV2());
      }
      if (file != null && file.isNotEmpty) {
        Uint8List bytes = file["bytes"] as Uint8List;

        request.files.add(
          http.MultipartFile.fromBytes(
            "file",
            bytes,
            filename: file["fileName"],
            contentType: file["fileName"].endsWith(".jpg")
                ? MediaType("image", "jpeg")
                : MediaType("image", "png"),
          ),
        );
      }

      final response = await http.Response.fromStream(await request.send());
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        var successResponse = {
          "statusCode": response.statusCode,
          "content": const Utf8Decoder(allowMalformed: true)
              .convert(response.bodyBytes),
        };
        return successResponse;
      } else {
        var erroBody = {
          "statusCode": response.statusCode,
          "errorContent": jsonDecode(response.body)["erro"]
        };

        return erroBody;
      }
    } on Exception {
      return Future.error("Sorry, we have a problem with our servers!");
    }
  }
}
