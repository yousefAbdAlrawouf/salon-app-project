import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:salon_app/core/Dio/service_locator.dart';
import 'package:salon_app/core/app_manger/app_manager_state.dart';
import 'package:salon_app/core/constants/cashe_string.dart';
import 'package:salon_app/core/network/app_dio.dart';
import 'package:salon_app/features/Provider_App/auth/models/Auth_response.dart';

class AppManagerCubit extends Cubit<AppManagerState> {
  AppManagerCubit() : super(AppManagerState());

  saveUserDataInAppState(AuthResponseModel model) {
    _savAuthMddelInCache(model);

    getInstance<AppDio>().addTokenToHeader(model.token);
    emit(state.copyWith(authResponseModel: model));
  }



  initApp() async {
  log("Initializing app...");
  final AuthResponseModel? authDataFromCache = await _getUserData();
  if (authDataFromCache != null) {
    log("User data found: ${authDataFromCache.toJson()}");
    emit(state.copyWith(authResponseModel: authDataFromCache));
    getInstance<AppDio>().addTokenToHeader(authDataFromCache.token);
  } else {
    log("No valid user data found in cache. Resetting storage...");
    await logOut(); 
  }
}


  logOut() async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: CacheKeys.userData);
    emit(AppManagerState(isLogOutSuccess: false));
  }

  _savAuthMddelInCache(AuthResponseModel authData) async {
    final storage = FlutterSecureStorage();
    final encodedData = jsonEncode(authData.toJson());
  log("Saving user data: $encodedData"); // Log the JSON being saved
    await storage.write(key: CacheKeys.userData, value: encodedData);
  }

 Future<AuthResponseModel?> _getUserData() async {
  final storage = FlutterSecureStorage();
  final result = await storage.read(key: CacheKeys.userData);
  if (result != null) {
    try {
      final decodedData = jsonDecode(result) as Map<String, dynamic>?;
      if (decodedData == null) {
        throw Exception("Decoded data is null");
      }
            log("Decoded data: $decodedData"); // Log the decoded structure

      final userData = AuthResponseModel.fromJson(decodedData);
      
      return userData;
    } catch (e) {
      log("Error decoding user data: $e");
    }
  }
  return null;
}
}
