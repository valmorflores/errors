import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wordsContextApp/src/pages/users/direct/user_direct_page.dart';
import 'package:wordsContextApp/src/shared/models/user_model.dart';

import 'user_list_bloc.dart';
import 'user_list_module.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {

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
        title: Text("Network"),
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
                subtitle: Text(item.email),
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => UserDirectPage()));
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
