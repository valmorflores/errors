import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wordsContextApp/src/pages/users/relogin/user_relogin_repository.dart';
import 'package:wordsContextApp/src/shared/custom_dio/custom_dio.dart';
import 'package:wordsContextApp/src/shared/models/user_me_data_model.dart';
import 'package:wordsContextApp/src/shared/models/user_model.dart';

class UserReloginPage extends StatefulWidget {
  final Function onSuccess;

  const UserReloginPage({Key key, this.onSuccess}) : super(key: key);
  @override
  _UserReloginPageState createState() => _UserReloginPageState();
}

class _UserReloginPageState extends State<UserReloginPage> {
  var bloc;

  Controller controller;
  UserReloginRepository repository = new UserReloginRepository();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login user"),
        centerTitle: false,
      ),
      body: FutureBuilder( future: repository.userRelogin(),
          builder: (context, snapshot) {
            if (snapshot.hasError) { 
               print( 'Ocorreu um erro');
               print( snapshot.error );
               return Center(child: Text("${snapshot.error}",style: TextStyle(fontSize: 25)));
            }
            if (snapshot.hasData) {
              print( 'Retornou dados');
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else{
                /*Timer(Duration(seconds: 1), (){
                   Navigator.pop(context);
                });
                */
                return Center(child: Text("Login efetuado com sucesso",style: TextStyle(fontSize: 25),));
              }
            
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[                  
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Center( child: Container(
                      padding: EdgeInsets.all(5),
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all( Radius.circular( 7 ) ),
                      ),
                      child: SizedBox.expand( child: FlatButton(                      
                        //color: Colors.blue,
                        child: Text(
                          "E N T E R",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          //if (controller.validate()) {       
                            print('Relogin: Sending to bloc - via responseIn');
                            //bloc.email = 'mariana1@gmail.com';
                            //bloc.password = '160302';
                            //bloc.postIn.add(UserModel(
                            //    name: bloc.email, email: bloc.email, password: bloc.password));
                          //}
                        }
                      ),
                    ),
                    ),
                  ),
                  ),
                ],
              );
            }
          }),
    );
  }
}

class Controller {
  var formKey = GlobalKey<FormState>();

  bool validate() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else
      return false;
  }
}
