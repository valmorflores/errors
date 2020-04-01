
import 'package:wordsContextApp/src/shared/constants.dart';
import 'package:wordsContextApp/src/shared/custom_dio/interceptors.dart';
import 'package:dio/native_imp.dart'; //If in browser, import 'package:dio/browser_imp.dart'
import 'package:wordsContextApp/src/shared/custom_dio/interceptorsLoggin.dart';

import '../constants.dart';

class CustomDio extends DioForNative {

  CustomDio(){
    options.baseUrl = BASE_URL;
    print('url:' + BASE_URL );
    interceptors.add(CustomIntercetors());
    //interceptors.add(LoggingInterceptors());
    options.connectTimeout = 5000;
    options.receiveTimeout = 5000;
    print('customDio instanciado' );
  }

}