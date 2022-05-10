import 'dart:convert';
import 'package:http/http.dart' as http;

class VillainService {
  Future<Map<String, dynamic>>? findVillainByName(String villainName) async {
    var url = "http://localhost:8080/villains/$villainName";

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode >= 200 || response.statusCode <= 299) {
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
    } on Exception catch (e) {
      throw Future.error(e);
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
    } on Exception catch (e) {
      throw Future.error(e);
    }
  }
}
