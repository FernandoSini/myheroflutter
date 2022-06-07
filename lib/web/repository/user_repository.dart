import 'package:my_hero_academia/web/data/db.dart';

class UserRepository {
  Future<void> saveUser(String jsonData) async {
    await DB.save(jsonData, 'user');
  }

  Future<void> read(String key) async {
    await DB.getByKey(key);
  }
}
