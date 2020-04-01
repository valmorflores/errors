import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:wordsContextApp/src/app/app_module.dart';
import 'package:wordsContextApp/src/pages/posts/create/create_bloc.dart';
import 'package:wordsContextApp/src/pages/posts/home/home_repository.dart';
import 'package:wordsContextApp/src/pages/posts/update/update_bloc.dart';
import 'package:wordsContextApp/src/shared/custom_dio/custom_dio.dart';

import 'home_bloc.dart';
import 'home_page.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc(HomeModule.to.getDependency<HomeRepository>())),
        Bloc((i) => CreateBloc(HomeModule.to.getDependency<HomeRepository>())),
        Bloc((i) => UpdateBloc(HomeModule.to.getDependency<HomeRepository>()))
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency(
            (i) => HomeRepository(AppModule.to.getDependency<CustomDio>()))
      ];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
