/* //import 'user.model.dart';

class APIResponse<T> {
  String? message;
  int? status;
  T? result;
  bool get statusOk => status == 200;
  APIResponse({this.message, this.status = 0, this.result});

  factory APIResponse.userFromJson(Map<String, dynamic> json) {
    var objectReturn;
    objectReturn =
        json['result'] != null ? User.fromJson(json['result']) : null;
    var result = APIResponse<T>(
        message: json['message'], status: json['status'], result: objectReturn);

    return result;
  }

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    var result = APIResponse<T>(
        message: json['message'],
        status: json['status'],
        result: json['result']);
    return result;
  }
}
 */