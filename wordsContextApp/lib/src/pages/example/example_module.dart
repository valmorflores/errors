import 'package:wordsContextApp/src/pages/example/example_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:wordsContextApp/src/pages/example/example_page.dart';

class ExampleModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ExampleBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ExamplePage();

  static Inject get to => Inject<ExampleModule>.of();
}
