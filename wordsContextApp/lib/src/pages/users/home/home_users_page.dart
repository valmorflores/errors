import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wordsContextApp/src/pages/users/create/create_users_page.dart';
import 'package:wordsContextApp/src/shared/models/user_model.dart';
import 'package:wordsContextApp/src/pages/users/update/update_users_page.dart';
import 'package:wordsContextApp/src/pages/users/home/home_users_bloc.dart';
import 'package:wordsContextApp/src/pages/users/home/home_users_module.dart';

class HomeUsersPage extends StatefulWidget {
  @override
  _HomeUsersPageState createState() => _HomeUsersPageState();
}

class _HomeUsersPageState extends State<HomeUsersPage> {

  var bloc = HomeUsersModule.to.getBloc<HomeUsersBloc>();

  @override
  void initState() {
    bloc.getUsers();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
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
                title: Text(item.email),
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => UpdateUsersPage(snapshot: item,)));
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
