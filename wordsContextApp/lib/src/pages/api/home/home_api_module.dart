import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:wordsContextApp/src/app/app_module.dart';
import 'package:wordsContextApp/src/pages/api/create/create_api_bloc.dart';
import 'package:wordsContextApp/src/pages/api/home/home_api_bloc.dart';
import 'package:wordsContextApp/src/pages/api/home/home_api_page.dart';
import 'package:wordsContextApp/src/pages/api/home/home_api_repository.dart';
import 'package:wordsContextApp/src/pages/api/update/update_bloc.dart';
import 'package:wordsContextApp/src/shared/custom_dio/custom_dio.dart';
 

class HomeApiModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeApiBloc(HomeApiModule.to.getDependency<HomeApiRepository>())),
        Bloc((i) => CreateApiBloc(HomeApiModule.to.getDependency<HomeApiRepository>())),
        Bloc((i) => UpdateBloc(HomeApiModule.to.getDependency<HomeApiRepository>()))
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency(
            (i) => HomeApiRepository(AppModule.to.getDependency<CustomDio>()))
      ];

  @override
  Widget get view => HomeApiPage();

  static Inject get to => Inject<HomeApiModule>.of();
}
