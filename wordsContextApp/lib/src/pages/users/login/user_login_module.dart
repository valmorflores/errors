import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:wordsContextApp/src/app/app_module.dart';
import 'package:wordsContextApp/src/pages/users/login/user_login_repository.dart';
import 'package:wordsContextApp/src/pages/users/login/user_login_bloc.dart';
import 'package:wordsContextApp/src/shared/custom_dio/custom_dio.dart';

import 'user_login_page.dart';
 

class UserLoginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => UserLoginBloc(UserLoginModule.to.getDependency<UserLoginRepository>())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency(
            (i) => UserLoginRepository(AppModule.to.getDependency<CustomDio>()))
      ];

  @override
  Widget get view => UserLoginPage();

  static Inject get to => Inject<UserLoginModule>.of();
}
