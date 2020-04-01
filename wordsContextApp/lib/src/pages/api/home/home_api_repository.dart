import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wordsContextApp/src/shared/custom_dio/custom_dio.dart';
import 'package:wordsContextApp/src/shared/models/api_model.dart';

class HomeApiRepository {
  final CustomDio _client;
  
  HomeApiRepository(this._client);

  Future<List<ApiModel>> getApiData() async {
    Data data;
    Data localinfo;
    List<ApiModel>listaDeDados = [];
    String cSystem;
    String cFolder;
    
    try {
      print('API /version - Getting...');
      var response = await _client.get("/version");
      /*return (response.data as List)
          .map((item) => ApiModel.fromJson(item))
          .toList();*/ 
      final info = response.data;    
      data = new Data(
        system: info['data']['system'], 
        version: info['data']['version'],
        developer: info['data']['developer'],
        baseUrl: info['data']['baseUrl'] );

      if ( Platform.isLinux ) {
         cSystem = 'Linux';
         cFolder = ( await Directory.current ).path;
         //cFolder = File.fromRawPath(rawPath)
      }
      if ( Platform.isWindows ) {
         cSystem = 'Windows';
         cFolder = ( await getApplicationDocumentsDirectory() ).path;
         //cFolder = File.fromRawPath(rawPath)
      }
      if ( Platform.isAndroid ) {
         cFolder = ( await getApplicationDocumentsDirectory() ).path;
         cSystem = 'Android';
      }
      
      localinfo = new Data(system: cSystem,
         version: cFolder,
         developer: '',
         baseUrl: '');
      
      return [ new ApiModel( data: data ), new ApiModel( data: localinfo ) ];
    } on DioError catch (e) {
      throw (e.message);
    }
  }

}