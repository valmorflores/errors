import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:wordsContextApp/src/app/app_module.dart';
import 'package:wordsContextApp/src/pages/words/home/home_words_bloc.dart';
import 'package:wordsContextApp/src/pages/words/home/home_words_page.dart';
import 'package:wordsContextApp/src/pages/words/home/home_words_repository.dart';
import 'package:wordsContextApp/src/shared/custom_dio/custom_dio.dart';
 
class HomeWordsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeWordsBloc(HomeWordsModule.to.getDependency<HomeWordsRepository>())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency(
            (i) => HomeWordsRepository(AppModule.to.getDependency<CustomDio>()))
      ];

  @override
  Widget get view => HomeWordsPage();

  static Inject get to => Inject<HomeWordsModule>.of();
}
