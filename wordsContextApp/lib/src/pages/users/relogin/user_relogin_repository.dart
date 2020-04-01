import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordsContextApp/src/shared/custom_dio/custom_dio.dart';
import 'package:wordsContextApp/src/shared/helpers/database_profile_helper.dart';
import 'package:wordsContextApp/src/shared/models/user_me_data_model.dart';
import 'package:wordsContextApp/src/shared/models/user_model.dart';
import 'package:wordsContextApp/src/shared/globals.dart';

class UserReloginRepository {

  CustomDio _client;

  UserReloginRepository(){
     _client = new CustomDio();
  }

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

  Future <UserMeDataModel> userRelogin() async {
    print( 'Declarando SharedPreferences');
    SharedPreferences sharedPreferences;
    print( 'Declarando UserMeDataModel - dataresposta');
    UserMeDataModel dataresposta;
    print( 'Declarando e-mail e token');
    String email = '', token = '';
    print( 'Declarando userMe');
    User userMe;
    print( 'Entrando no try');
    try {   
      print( 'Testing platform');
      if ( Platform.isAndroid ){
         print('IsAndroid - Local (shared) get header');
         sharedPreferences = await SharedPreferences.getInstance();
         token = sharedPreferences.getString('token');
         email = sharedPreferences.getString('email');
      }
      else
      {
         print('Not IsAndroid - Local (database) get header');
         dataresposta = await recoveryUserData();
         token = dataresposta.accessToken;
         email = dataresposta.user.email;
      }
      Globals.headers['Authorization']='Bearer ' + token;
      print('API /auth/login - Getting words/1: ' + email);
      var response = await _client.get("/words/1");
      /*return (response.data as List)
          .map((item) => UserModel.fromJson(item))
          .toList();*/ 
      print('API /auth/login - Reponse...');
      final info = response.data;
      print( info.toString() );    
      userMe= new User( email: email );
      dataresposta = new UserMeDataModel(
        user: userMe, 
        accessToken: token );
      // De globals
      //Globals.headers['Authorization']='Bearer ' + info['access_token'];
      print('API /ath/login - Data...');
      //print('Token:' + info['access_token'] );
      //print('profile:recovery');
      //recoveryUserData(userMeData: dataresposta );
      Globals.isLoggedIn=true;
      //print('profile:memorize');
      //memorizeUserData( userMeData: dataresposta );
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
    data = recoveryUserData();    
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

  recoveryUserData() async {
      DatabaseProfileHelper database = DatabaseProfileHelper.instance;
      Profile userProfile;
      UserMeDataModel userMeProfile;
      //userProfile = new Profile( profile: userMeData.user.email, token: userMeData.accessToken );
      userProfile = await database.queryProfile( 1 );
      userMeProfile.user.email = userProfile.profile;
      userMeProfile.accessToken = userProfile.token;
      return userMeProfile;
  }


}