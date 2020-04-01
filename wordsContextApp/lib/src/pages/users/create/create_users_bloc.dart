import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:wordsContextApp/src/pages/users/home/home_users_repository.dart';
import 'package:wordsContextApp/src/shared/models/user_model.dart';

class CreateUsersBloc extends BlocBase {
  final HomeUsersRepository repo;

  CreateUsersBloc(this.repo){
    responseOut = user.switchMap(observablePost);
  }

  String email;
  String password;

  var user = BehaviorSubject<UserModel>();

  UserModel get userValue => user.value;
  Stream<int> responseOut;
  Sink<UserModel> get userIn => user.sink;

  Stream<int> observablePost(UserModel data) async* {
    yield 0;
    try{
    var response = await repo.createUser(data.toJson());
    yield response;
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
