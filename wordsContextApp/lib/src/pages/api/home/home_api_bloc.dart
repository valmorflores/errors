import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wordsContextApp/src/pages/api/home/home_api_repository.dart';
import 'package:wordsContextApp/src/shared/models/api_model.dart';

class HomeApiBloc extends BlocBase {
 
 final HomeApiRepository repo;

  HomeApiBloc(this.repo);

  var listApi = BehaviorSubject<List<ApiModel>>();
  Sink<List<ApiModel>> get responseIn => listApi.sink;
  Stream<List<ApiModel>> get responseOut => listApi.stream;
  
  void getApiData() async{
    print('getAPIData');
    responseIn.add(null);
    try{
    var res = await repo.getApiData();
    print( 'Repo: ' + repo.toString() );
    responseIn.add(res);
    print('dados a seguir:');
    print( responseIn.toString() );
    print('dados ok.');
    }catch(e){
      listApi.addError(e);
    }
  }

  @override
  void dispose() {
    listApi.close();
    super.dispose();
  }
}
