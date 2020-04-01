import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:wordsContextApp/src/pages/users/login/user_login_repository.dart';
import 'package:wordsContextApp/src/shared/models/user_me_data_model.dart';
import 'package:wordsContextApp/src/shared/models/user_model.dart';

class UserLoginBloc extends BlocBase {
  final UserLoginRepository repo;
  final _emailController = StreamController<String>();

  UserLoginBloc(this.repo)
  {
    responseOut = user.switchMap(observablePost);
  }

  String email;
  String password;
  String token;
  int id;

  var user = BehaviorSubject<UserModel>();

  UserModel get postValue => user.value;
  Stream<UserMeDataModel> responseOut;
  Sink<UserModel> get userIn => user.sink;

  Stream<UserMeDataModel> observablePost(UserModel data) async* {
    yield null;
    try{
      var response = await repo.userLogin(data.toJson());
      if (response != null){
         yield response;  
      }
      else
      {
         yield null;
      }
    }catch(e){
      throw e;
    }
  }

  @override
  void dispose() {
    user.close();
    super.dispose();
  }
}
