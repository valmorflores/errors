import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
 
import 'package:wordsContextApp/src/pages/users/home/home_users_repository.dart';
import 'package:wordsContextApp/src/shared/models/user_model.dart';

class UpdateUsersBloc extends BlocBase {
  final HomeUsersRepository repo;

  UpdateUsersBloc(this.repo){
    responseOut = user.switchMap(observableuser);
  }

  String title;
  String body;
  int id;

  var user = BehaviorSubject<UserModel>();

  UserModel get userValue => user.value;
  Stream<int> responseOut;
  Sink<UserModel> get userIn => user.sink;

  Stream<int> observableuser(UserModel data) async* {
    yield 0;
    try{
    var response = await repo.updateUser(data.toJson(),id);
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
