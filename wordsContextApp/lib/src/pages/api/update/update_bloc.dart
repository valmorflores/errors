import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:wordsContextApp/src/pages/api/home/home_api_repository.dart';
import 'package:wordsContextApp/src/shared/models/api_model.dart';

class UpdateBloc extends BlocBase {
  final HomeApiRepository repo;

  UpdateBloc(this.repo){
    responseOut = post.switchMap(observablePost);
  }

  String title;
  String body;
  int id;

  var post = BehaviorSubject<ApiModel>();

  ApiModel get postValue => post.value;
  Stream<int> responseOut;
  Sink<ApiModel> get postIn => post.sink;

  Stream<int> observablePost(ApiModel data) async* {
    yield 0;
    /*try{
    var response = await repo.updatePost(data.toJson(),id);
    yield response;
    }catch(e){
      throw e;
    }*/
  }

  @override
  void dispose() {
    post.close();
    super.dispose();
  }
}
