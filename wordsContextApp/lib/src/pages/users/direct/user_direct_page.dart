import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wordsContextApp/src/pages/posts/update/update_page.dart';
import 'package:wordsContextApp/src/pages/users/list/user_list_bloc.dart';
import 'package:wordsContextApp/src/pages/users/list/user_list_module.dart';
import 'package:wordsContextApp/src/shared/models/user_model.dart';

class UserDirectPage extends StatefulWidget {
  @override
  _UserDirectPageState createState() => _UserDirectPageState();
}

class _UserDirectPageState extends State<UserDirectPage> {

  var bloc = UserListModule.to.getBloc<UserListBloc>();

  @override
  void initState() {
    bloc.getUsersList();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Direct Message"),
      ),
      body: SingleChildScrollView(
              child: StreamBuilder<List<UserModel>>(
          stream:bloc.responseOut ,
          builder: (context, snapshot) {

            if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()));
            }

            if(snapshot.hasData){
              return Column(children: snapshot.data.map((item) => ListTile(
                title: Text(item.name),
                onTap: (){
                  
                },
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
