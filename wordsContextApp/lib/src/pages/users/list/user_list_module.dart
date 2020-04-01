import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:wordsContextApp/src/app/app_module.dart';
import 'package:wordsContextApp/src/pages/users/list/user_list_bloc.dart';
import 'package:wordsContextApp/src/pages/users/list/user_list_repository.dart';
import 'package:wordsContextApp/src/shared/custom_dio/custom_dio.dart';

import 'user_list_page.dart';


class UserListModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => UserListBloc(UserListModule.to.getDependency<UserListRepository>())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency(
            (i) => UserListRepository(AppModule.to.getDependency<CustomDio>()))
      ];

  @override
  Widget get view => UserListPage();

  static Inject get to => Inject<UserListModule>.of();
}
