import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:wordsContextApp/src/app/app_module.dart';
import 'package:wordsContextApp/src/pages/users/create/create_users_bloc.dart';
import 'package:wordsContextApp/src/pages/users/home/home_users_bloc.dart';
import 'package:wordsContextApp/src/pages/users/home/home_users_page.dart';
import 'package:wordsContextApp/src/pages/users/home/home_users_repository.dart';
import 'package:wordsContextApp/src/pages/users/update/update_users_bloc.dart';
import 'package:wordsContextApp/src/shared/custom_dio/custom_dio.dart';

class HomeUsersModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeUsersBloc(HomeUsersModule.to.getDependency<HomeUsersRepository>())),
        Bloc((i) => CreateUsersBloc(HomeUsersModule.to.getDependency<HomeUsersRepository>())),
        Bloc((i) => UpdateUsersBloc(HomeUsersModule.to.getDependency<HomeUsersRepository>()))
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency(
            (i) => HomeUsersRepository(AppModule.to.getDependency<CustomDio>()))
      ];

  @override
  Widget get view => HomeUsersPage();

  static Inject get to => Inject<HomeUsersModule>.of();
}
