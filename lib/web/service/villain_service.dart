import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:my_hero_academia/web/models/villain_model.dart';

class VillainService {
  Future<Map<String, dynamic>>? findVillainByName(String villainName) async {
    var url = "http://localhost:8080/villains/$villainName";

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

        return erroBody;
      }
    } on Exception {
      return Future.error("Sorry, we have a problem with our servers!");
    }
  }

  Future<Map<String, dynamic>>? getAllVillains() async {
    var url = "http://localhost:8080/villains";

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

  /* Future<Map<String, dynamic>>? createVillain(VillainModel villain) async {
    String url = "localhost:8080/villains/create";
    try {
      final response =
          await http.post(Uri.parse(url), body: json.encode(villain.toJson()));
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
  Future<Map<String, dynamic>>? createVillain(
      VillainModel villain, Map<String, dynamic>? file) async {
    String url = "http://localhost:8080/villains/create";
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
      if (villain.toJsonV2().isNotEmpty) {
        request.fields.addAll(villain.toJsonV2());
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
    } on Exception catch (e) {
      return Future.error("Sorry, we have a problem with our servers!$e");
    }
  }
}
