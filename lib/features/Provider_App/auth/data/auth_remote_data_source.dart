import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:salon_app/core/models/user_model.dart';
import 'package:salon_app/core/network/api.dart';
import 'package:salon_app/core/network/api_request.dart';
import 'package:salon_app/core/network/api_response.dart';
import 'package:salon_app/core/network/api_urls.dart';
import 'package:salon_app/core/network/failure.dart';
import 'package:salon_app/features/Provider_App/auth/data/abstract_auth_remote.dart';
import 'package:salon_app/features/Provider_App/auth/models/Auth_response.dart';
import 'package:salon_app/features/Provider_App/auth/models/editProfileParams.dart';
import 'package:salon_app/features/Provider_App/auth/models/login_model.dart';
import 'package:salon_app/features/Provider_App/auth/models/register_model.dart';
class AuthRemoteDataSourceImplement implements AuthRemoteDataSource {
  final API api;
  AuthRemoteDataSourceImplement({required this.api});
  @override
  Future<Either<Failure, T>> makeRequest<T>(
      {required String url,
      required Map<String, dynamic> body,
      required T Function(dynamic) fromJson,
      required String method}) async {
    try {
      final ApiRequest request = ApiRequest(url: url, body: body);
      final ApiResponse response;
      switch (method.toUpperCase()) {
        case 'GET':
          response = await api.get(request);
          break;
        case 'POST':
          response = await api.post(request);
          break;
        case 'DELETE':
          response = await api.delete(request);
          break;
        case 'PUT':
          response = await api.put(request);
          break;
        default:
          throw Exception('Unsupported HTTP method: $method');
      }

      if (response.statusCode == 200) {
        return Right(fromJson(response.body));
      } else {
        return Left(Failure(
          statusCode: response.statusCode,
          message: response.body['message'] ?? 'Unknown error occurred',
        ));
      }
    } 
    on DioException catch (e) {
      return Left(Failure.handleException(e));
    } catch (e) {
      log("Error: $e");
      return Left(Failure(message: e.toString()));
    }
  }
  

  @override
  Future<Either<Failure, AuthResponseModel>> loginUser(LoginUserParams params) {
    return makeRequest<AuthResponseModel>(
      url: ApiUrls.login,
      method: "post",
      body: params.toJson(),
      fromJson: (data) => AuthResponseModel(
        token: data["data"]["token"],
        role: data["data"]["role"],
        user: UserModel.fromJson(data["data"]["user"]),
      ),
    );
  }

  @override
  Future<Either<Failure, AuthResponseModel>> registerAsProvider(
      CreateNewUserParams params) {
    return makeRequest<AuthResponseModel>(
      url: ApiUrls.registerAsProvider,
      method: "post",
      body: params.toJson(),
      fromJson: (data) => AuthResponseModel.fromJson(data),
    );
  }

  @override
  Future<Either<Failure, String>> editProfile(Editprofileparams params) {
    return makeRequest<String>(
      url: ApiUrls.profile,
      method: "post",
      body: params.toJson(),
      fromJson: (data) => "Edited successfully",
    );
  }

  @override
  Future<Either<Failure, Map<String, String>>> resetPassword(String phoneNumber,
      String code, String password, String passwordConfirmation) {
    return makeRequest<Map<String, String>>(
      url: ApiUrls.resetPassword,
      method: "post",
      body: {
        "phone": phoneNumber,
        "code": code,
        "password": password,
        "password_confirmation": passwordConfirmation,
      },
      fromJson: (data) => {'message': data['message']},
    );
  }

  @override
  Future<Either<Failure, Map<String, String>>> verifyCode(
      String phoneNumber, String code, String forRegister) {
    return makeRequest<Map<String, String>>(
      url: ApiUrls.verifyCode,
      method: "post",
      body: {
        "phone": phoneNumber,
        "code": code,
        "for_register": forRegister,
      },
      fromJson: (data) => {'message': data['message']},
    );
  }

  @override
  Future<Either<Failure, Map<String, String>>> forgetPassword(String phoneNumber) {
    return makeRequest<Map<String, String>>(
        url: ApiUrls.forgetPassword,
        method: "post",
        body: {"phone": phoneNumber},
        fromJson: (data) => {'message': data['message']});
  }


}
