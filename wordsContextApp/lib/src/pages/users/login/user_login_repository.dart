import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordsContextApp/src/shared/custom_dio/custom_dio.dart';
import 'package:wordsContextApp/src/shared/helpers/database_profile_helper.dart';
import 'package:wordsContextApp/src/shared/models/user_me_data_model.dart';
import 'package:wordsContextApp/src/shared/models/user_model.dart';
import 'package:wordsContextApp/src/shared/globals.dart';

class UserLoginRepository {

  final CustomDio _client;

  UserLoginRepository(this._client);

  Future<UserModel> getUserData() async {
    UserModel data;
    List<UserModel>listaDeDados = [];
    try {
      print('API /version - Getting...');
      var response = await _client.get("/users");
      /*return (response.data as List)
          .map((item) => UserModel.fromJson(item))
          .toList();*/ 
      final info = response.data;    
      data = new UserModel(
        name: info['name'], 
        id: info['id'] );
      return data;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future <UserMeDataModel> userLogin( data ) async {
    Future<SharedPreferences> _sharedPreferences = SharedPreferences.getInstance();
    SharedPreferences sharedPreferences;
    UserMeDataModel dataresposta;
    List<UserModel>listaDeDados = [];
    User userMe;
    try {
      print('API /ath/login - Getting...');
      var response = await _client.post("/auth/login", data: data);
      /*return (response.data as List)
          .map((item) => UserModel.fromJson(item))
          .toList();*/ 
      print('API /ath/login - Reponse...');
      final info = response.data;    
      userMe= new User( email: info['user']['email'] );
      dataresposta = new UserMeDataModel(
        user: userMe, 
        accessToken: info['access_token'] );
      // De globals
      Globals.headers['Authorization']='Bearer ' + info['access_token'];
      print('API /ath/login - Data...');
      //print('Token:' + info['access_token'] );
      //print('profile:recovery');
      //recoveryUserData(userMeData: dataresposta );
      print('profile:memorize');
      if ( Platform.isAndroid ){
         print( 'Shared - get instance to save');
         sharedPreferences = await _sharedPreferences;
         print( 'Shared - save token');
         sharedPreferences.setString('token', info['access_token'].toString());
         print( 'Shared - save e-mail = ' + info['user']['email']);
         sharedPreferences.setString('email', info['user']['email'].toString());
      }
      else
      {
         memorizeUserData( userMeData: dataresposta );
      }
      print( 'Setting - is logged in true');
      Globals.isLoggedIn=true;
      
      return dataresposta; //dataresposta; //dataresposta;
    } on DioError catch (e) {
      //Globals.isLoggedIn=false;
      throw (e.message);
    }
  }

  Future<UserModel> getUserLocalData() async {
    UserModel data;
    User userMe;
    UserMeDataModel dataresposta; 
    userMe= new User( email: '' );
    print('Local information getting...');
    dataresposta = new UserMeDataModel(
        user: userMe, 
        accessToken: '' );
    data = recoveryUserData(userMeData: dataresposta);    
    return data;
  }

  // Save userdata into local profile database
  memorizeUserData( {UserMeDataModel userMeData} ){
      DatabaseProfileHelper database = DatabaseProfileHelper.instance;
      Profile userProfile;
      userProfile = new Profile( profile: userMeData.user.email, token: userMeData.accessToken );
      userProfile.profile = userMeData.user.email;
      userProfile.token = userMeData.accessToken;
      database.insert( profile: userProfile );
  }

  recoveryUserData( {UserMeDataModel userMeData} ) async {
      DatabaseProfileHelper database = DatabaseProfileHelper.instance;
      Profile userProfile;
      userProfile = new Profile( profile: userMeData.user.email, token: userMeData.accessToken );
      userProfile = await database.queryProfile( 1 );
      
  }


}