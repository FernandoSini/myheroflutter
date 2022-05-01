import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_hero_academia/web/models/Hero.dart';

class HeroService {
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

  Future<dynamic> findHeroByName(String heroName) async {
    var url = "http://192.168.0.22:8080/heroes/$heroName";

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode >= 200 || response.statusCode <= 299) {
        print(response.body);
        var successResponse = {
          "statusCode": response.statusCode,
          "content": jsonDecode(
            const Utf8Decoder(allowMalformed: true).convert(response.bodyBytes),
          ),
        };
        return successResponse;
      } else {
        print(response.body);
        var erroBody = {
          "statusCode": response.statusCode,
          "errorContent": jsonDecode(response.body)["error"]
        };

        return erroBody;
      }
    } on Exception catch (e) {
      throw Future.error(e);
    }
  }
}
