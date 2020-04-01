import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wordsContextApp/src/pages/words/home/home_words_repository.dart';
import 'package:wordsContextApp/src/shared/models/word_model.dart';

class HomeWordsBloc extends BlocBase {
 
 final HomeWordsRepository repo;

  HomeWordsBloc(this.repo);

  var listWords = BehaviorSubject<List<WordModel>>();
  Sink<List<WordModel>> get responseIn => listWords.sink;
  Stream<List<WordModel>> get responseOut => listWords.stream;
  
  void getWordsData() async{
    print('getWordsData');
    responseIn.add(null);
    try{
    var res = await repo.getWordsData();
    print( 'Repo: ' + repo.toString() );
    responseIn.add(res);
    print('dados a seguir:');
    print( responseIn.toString() );
    print('dados ok.');
    }catch(e){
      listWords.addError(e);
    }
  }

  @override
  void dispose() {
    listWords.close();
    super.dispose();
  }
}
