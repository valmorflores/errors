import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:wordsContextApp/src/shared/custom_dio/custom_dio.dart';
import 'package:wordsContextApp/src/shared/models/word_model.dart';

class HomeWordsRepository {
  final CustomDio _client;

  HomeWordsRepository(this._client);

  Future<List<WordModel>> getWordsData() async {
    WordsData data;
    List<WordModel>listaDeDados = [];
    try {
      print('API /words - Getting...');
      var response = await _client.get("/words");
      return (response.data as List)
          .map((item) => WordModel.fromJson(item))
          .toList();
      /*final info = response.data;    
      data = new WordsData(
        system: info['data']['system'], 
        version: info['data']['version'],
        developer: info['data']['developer'],
        baseUrl: info['data']['baseUrl'] );
      return [ new WordModel( data: data ) ];*/
    } on DioError catch (e) {
      throw (e.message);
    }
  }

}