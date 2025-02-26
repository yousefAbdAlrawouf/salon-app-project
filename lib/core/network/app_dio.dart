import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppDio {
  late Dio _dio;

  AppDio() {
    //setDIO();
    _dio = Dio();
    _initDio();
    _addLoggerToDIo();
  }

  // setDIO() {
  //   _dio = Dio();
  // }

  Dio get dio => _dio;

  _initDio() {
    log('This is the first step to build Dio (without token)');

    _dio.options.headers.addAll({
      "Accept": Headers.jsonContentType,
    });
  }

  addTokenToHeader(String token) {
    log('This is the last step to build Dio (with token) $token');
    _dio.options.headers.addAll({
      "Authorization": 'Basic Auth $token',
    });
  }

  _addLoggerToDIo(){
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args){
            // don't print requests with uris containing '/posts' 
            if(options.path.contains('/posts')){
              return false;
            }
            // don't print responses with unit8 list data
            return !args.isResponse || !args.hasUint8ListData;
          }
      )
    );
  }


}
