import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wordsContextApp/src/shared/models/user_me_data_model.dart';
import 'package:wordsContextApp/src/shared/models/user_model.dart';
import 'user_login_bloc.dart';
import 'user_login_module.dart';

class UserLoginPage extends StatefulWidget {
  final Function onSuccess;

  const UserLoginPage({Key key, this.onSuccess}) : super(key: key);
  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  var bloc = UserLoginModule.to.getBloc<UserLoginBloc>();

  Controller controller;

  @override
  void didChangeDependencies() {
    controller = Controller();
    /*var listenResponse = bloc.responseOut.listen((data) {
      if (data == 201) {
        Timer(Duration(seconds: 1), () {
          widget.onSuccess();
          Navigator.pop(context);
        });
      }
    });*/
    super.didChangeDependencies();
  }

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
      body: StreamBuilder<UserMeDataModel>(
          stream: bloc.responseOut,
          builder: (context, snapshot) {
            if (snapshot.hasError) { 
               return Center(child: Text("${snapshot.error}",style: TextStyle(fontSize: 25)));
            }
            if (snapshot.hasData) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else{
                Timer(Duration(seconds: 1), (){
                   Navigator.pop(context);
                });
                return Center(child: Text("Login efetuado com sucesso",style: TextStyle(fontSize: 25),));
              }
            
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) => bloc.email = value,
                            validator: (value) => value.isEmpty
                                ? "O e-mail é obrigatório"
                                : null,
                            decoration: const InputDecoration(
                  labelText: 'e-mail',
                  icon: const Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: const Icon(Icons.person)
                      )
                      ),
                          ),
                          TextFormField(
                            obscureText: true,
                            onSaved: (value) => bloc.password = value,
                            validator: (value) => value.isEmpty
                                ? "A senha é obrigatória"
                                : null,
                            maxLines: 1,
                            decoration: const InputDecoration(
                  labelText: 'Password',
                  icon: const Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: const Icon(Icons.lock)
                      )
                      ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Efetuar login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (controller.validate()) {       
                          print('Sending to bloc - via userIn');
                          bloc.userIn.add(UserModel(
                              name: bloc.email, 
                              email: bloc.email, 
                              password: bloc.password));
                        }
                      }
                    ),
                  )
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
