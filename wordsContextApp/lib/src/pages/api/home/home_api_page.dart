import 'dart:async';

import 'package:flutter/material.dart';

import 'package:wordsContextApp/src/pages/api/home/home_api_bloc.dart';
import 'package:wordsContextApp/src/pages/api/home/home_api_module.dart';
import 'package:wordsContextApp/src/pages/users/list/user_list_module.dart';
import 'package:wordsContextApp/src/pages/users/login/user_login_module.dart';
import 'package:wordsContextApp/src/shared/models/api_model.dart';
import 'package:wordsContextApp/src/shared/globals.dart';
import 'components/custom_drawer.dart';

class HomeApiPage extends StatefulWidget {
  @override
  _HomeApiPageState createState() => _HomeApiPageState();
}

class _HomeApiPageState extends State<HomeApiPage> {
  var bloc = HomeApiModule.to.getBloc<HomeApiBloc>();

  @override
  void initState() {
    bloc.getApiData();
    print('InitState: API page');
    super.initState();
    print('StartedS');
  }

  @override
  Widget build(BuildContext context) {
    print('scaff');
    return Scaffold(
      appBar: AppBar(
        title: Text("Api"),
      ),
      drawer: HomeCustomDrawer(),
      body: SingleChildScrollView(
        child: StreamBuilder<List<ApiModel>>(
            stream: bloc.responseOut,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Ops! Comunication error'),
                      subtitle: Text(snapshot.error.toString()),
                    )
                  ],
                );
              }
              if (snapshot.hasData) {
                return Column(children: <Widget>[
                  Container( 
                    height: MediaQuery.of(context).size.height-240,
                    child:
                    Column(
                    children: snapshot.data
                        .map((item) => ListTile(
                              title: Text(item.data.system),
                              subtitle: Text(item.data.version +
                                  ' ' +
                                  item.data.developer +
                                  ' '),
                            ))
                        .toList(),
                  ),
                ),
                Container( height: 90,
                color:Colors.black26),
                  Container(
                      padding: EdgeInsets.all(7),
                      color: Colors.white10,
                      child: TextField(
                        style: new TextStyle(
                          fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0,
                            //height: 2.0,
                            color: Colors.white),
                        autocorrect: false,
                        autofocus: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.loupe),
                            hintText: 'Search (word or context)'),
                      ),
                    ),
                  
                ]);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
      floatingActionButton: Globals.isLoggedIn == false
          ? FloatingActionButton(
              child: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserLoginModule()),
                );
              },
            )
          : null,
    );
  }
}
