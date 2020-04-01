import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wordsContextApp/src/pages/api/home/home_api_bloc.dart';
import 'package:wordsContextApp/src/pages/api/home/home_api_module.dart';
import 'package:wordsContextApp/src/pages/words/home/home_words_bloc.dart';
import 'package:wordsContextApp/src/pages/words/home/home_words_module.dart';
import 'package:wordsContextApp/src/shared/models/api_model.dart';
import 'package:wordsContextApp/src/shared/models/word_model.dart';

class HomeWordsPage extends StatefulWidget {
  @override
  _HomeWordsPageState createState() => _HomeWordsPageState();
}

class _HomeWordsPageState extends State<HomeWordsPage> {

  var bloc = HomeWordsModule.to.getBloc<HomeWordsBloc>();

  @override
  void initState() {
    bloc.getWordsData();
    print( 'InitState: API page');
    super.initState();
    print( 'StartedS');
  }

  @override
  Widget build(BuildContext context) {
    print('scaff');
    return Scaffold(
      appBar: AppBar(
        title: Text("Palavras (Pesquisar)"),
      ),
      body: SingleChildScrollView(
              child: StreamBuilder<List<WordModel>>(
          stream:bloc.responseOut,
          builder: (context, snapshot) {
            if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()));
            }
            if(snapshot.hasData){
              return Column(children: snapshot.data.map((item) => ListTile(
                title: Text('item.words.data'),
                subtitle: Text('item.data.version' + ' ' + 'item.data.developer' + ' '  ),
                )
                
                ).toList(),);
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          }
        ),
      ),
     /* floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage(

            onSuccess: bloc.getPosts,

          )));
        },
      ),*/
    );
  }
}
