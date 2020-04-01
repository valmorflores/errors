import 'package:dio/dio.dart';
import 'package:wordsContextApp/src/shared/custom_dio/custom_dio.dart';
import 'package:wordsContextApp/src/shared/models/user_model.dart';

class UserListRepository {
  final CustomDio _client;

  UserListRepository(this._client);

  Future<List<UserModel>> getUsersList() async {
    try {
      var response = await _client.get("/users");
      return (response.data as List)
          .map((item) => UserModel.fromJson(item))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}

//CREATE -> POST
//READ  -> GET
//UPDATE
//DELE
