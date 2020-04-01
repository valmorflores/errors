import 'package:dio/dio.dart';
import 'package:wordsContextApp/src/shared/custom_dio/custom_dio.dart';
import 'package:wordsContextApp/src/shared/models/user_me_data_model.dart';
import 'package:wordsContextApp/src/shared/models/user_model.dart';

class HomeUsersRepository {
  final CustomDio _client;

  HomeUsersRepository(this._client);

  Future<List<UserModel>> getUsers() async {
    try {
      var response = await _client.get("/users");
      return (response.data as List)
          .map((item) => UserModel.fromJson(item))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<int> getUser(int id) async {
    try {
      var response = await _client.get("/users/$id");
      return response.statusCode;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<int> createUser(Map<String, dynamic> data) async {
    try {
      var response = await _client.post("/register", data: data);
      return response.statusCode;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<int> updateUser(Map<String, dynamic> data,int id) async {
    try {
      var response = await _client.put("/users/$id", data: data);
      return response.statusCode;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<UserMeDataModel> loginUser(Map<String, dynamic> data) async {
    UserMeDataModel resultado;
    try {
      print('dados a renviar');
      print( data.toString() );
      print('--');
      var response = await _client.post("/auth/login", data: data);
      resultado = receiveDataAdjust( response );
      return resultado;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  receiveDataAdjust( response ){
    UserMeDataModel data;
    User userInfo;   
    String accessToken = '';
    final info = response.data;
    userInfo.name = info['user']['name'];
    userInfo.id = info['user']['id'];
    userInfo.email = info['user']['email'];
    userInfo.createdAt = info['user']['created_at'];
    userInfo.updatedAt = info['user']['updated_at'];
    data = new UserMeDataModel( user: userInfo, accessToken: accessToken );
    return data;
  }

}

//CREATE -> POST
//READ  -> GET
//UPDATE
//DELE
