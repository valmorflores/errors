import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:wordsContextApp/src/pages/api/home/home_api_repository.dart';
import 'package:wordsContextApp/src/shared/models/api_model.dart';

class CreateApiBloc extends BlocBase {
  final HomeApiRepository repo;

  CreateApiBloc(this.repo){
    responseOut = dataapi.switchMap(observablePost);
  }

  String version;
  String developer;

  var dataapi = BehaviorSubject<ApiModel>();

  ApiModel get postValue => dataapi.value;
  Stream<int> responseOut;
  Sink<ApiModel> get postIn => dataapi.sink;

  Stream<int> observablePost(ApiModel data) async* {
    yield 0;
    /*try{
    var response = await repo.createPost(data.toJson());
    yield response;
    }catch(e){
      throw e;
    }*/
  }

  @override
  void dispose() {
    dataapi.close();
    super.dispose();
  }
}
