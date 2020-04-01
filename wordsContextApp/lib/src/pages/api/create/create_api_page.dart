import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wordsContextApp/src/pages/api/home/home_api_module.dart';
import 'package:wordsContextApp/src/pages/api/create/create_api_bloc.dart';

class CreateApiPage extends StatefulWidget {
  final Function onSuccess;

  const CreateApiPage({Key key, this.onSuccess}) : super(key: key);
  @override
  _CreateApiPageState createState() => _CreateApiPageState();
}

class _CreateApiPageState extends State<CreateApiPage> {
  var bloc = HomeApiModule.to.getBloc<CreateApiBloc>();

  Controller controller;

  @override
  void didChangeDependencies() {
    controller = Controller();
  /*  listenResponse = bloc.responseOut.listen((data) {
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
        title: Text("Create Post"),
        centerTitle: true,
      ),
      body: StreamBuilder<int>(
          stream: bloc.responseOut,
          builder: (context, snapshot) {
            if (snapshot.hasError) return Center(child: Text("${snapshot.error}",style: TextStyle(fontSize: 25)));

            if (snapshot.hasData) {
              if (snapshot.data == 0) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else{
                Timer(Duration(seconds: 1), (){
                   Navigator.pop(context);
                });
                return Center(child: Text("Inserido com sucesso!",style: TextStyle(fontSize: 25),));
              }
            
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            onSaved: (value) => bloc.version = value,
                            validator: (value) => value.isEmpty
                                ? "O título não pode ser nulo"
                                : null,
                            decoration: InputDecoration(labelText: "Title"),
                          ),
                          TextFormField(
                            onSaved: (value) => bloc.developer = value,
                            validator: (value) => value.isEmpty
                                ? "O body não pode ser nulo"
                                : null,
                            maxLines: 3,
                            decoration: InputDecoration(labelText: "Body"),
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
                        "Enviar",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (controller.validate()) {
                        }
                      },
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
