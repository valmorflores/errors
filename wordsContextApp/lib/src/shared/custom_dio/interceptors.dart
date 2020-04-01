import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../globals.dart';

class CustomIntercetors extends InterceptorsWrapper{

  @override
  onRequest(RequestOptions options) async {
    print("REQUEST[${options.method}] => PATH: ${options.path}");
    /*SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    print('TOKEN:${token}');
    options.headers.addAll({"Token": "$token${DateTime.now()}"});
     */
    print( 'Interceptor / Authorization = '+ Globals.headers['Authorization']);
    options.headers.addAll({'Authorization' : Globals.headers['Authorization']});
    return options;
    }

  @override  
  onResponse(Response response) async {
      //200
      //201
      print("RESPONSE[${response.statusCode}] => PATH: ${response.request.path}");
     return response; 
    }

   @override 
   onError(DioError e) async {
      //Exception
      print("ERROR[${e.response.statusCode}] => PATH: ${e.request.path}");
      if(e.response.statusCode == 404)
      return DioError();

     return  e;
    }

}