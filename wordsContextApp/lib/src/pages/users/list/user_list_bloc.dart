import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wordsContextApp/src/pages/users/list/user_list_repository.dart';
import 'package:wordsContextApp/src/shared/models/user_model.dart';

class UserListBloc extends BlocBase {
 
 final UserListRepository repo;

  UserListBloc(this.repo);

  var listUsers = BehaviorSubject<List<UserModel>>();
  Sink<List<UserModel>> get responseIn => listUsers.sink;
  Stream<List<UserModel>> get responseOut => listUsers.stream;
  
  void getUsersList() async{
    responseIn.add(null);
    try{
    var res = await repo.getUsersList();
    responseIn.add(res);
    }catch(e){
      listUsers.addError(e);
    }
  }

  @override
  void dispose() {
    listUsers.close();
    super.dispose();
  }
}
