import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wordsContextApp/src/pages/users/home/home_users_repository.dart';
import 'package:wordsContextApp/src/shared/models/user_model.dart';

class HomeUsersBloc extends BlocBase {
 
 final HomeUsersRepository repo;

  HomeUsersBloc(this.repo);

  var listUser = BehaviorSubject<List<UserModel>>();
  Sink<List<UserModel>> get responseIn => listUser.sink;
  Stream<List<UserModel>> get responseOut => listUser.stream;
  
  void getUsers() async{
    responseIn.add(null);
    try{
    var res = await repo.getUsers();
    responseIn.add(res);
    }catch(e){
      listUser.addError(e);
    }
  }

  @override
  void dispose() {
    listUser.close();
    super.dispose();
  }
}
