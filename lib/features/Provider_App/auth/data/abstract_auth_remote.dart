import 'package:dartz/dartz.dart';

import 'package:salon_app/core/network/failure.dart';
import 'package:salon_app/features/Provider_App/auth/models/Auth_response.dart';
import 'package:salon_app/features/Provider_App/auth/models/editProfileParams.dart';
import 'package:salon_app/features/Provider_App/auth/models/login_model.dart';
import 'package:salon_app/features/Provider_App/auth/models/register_model.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, T>> makeRequest<T>(
    {
    required String url,
    required Map<String, dynamic> body,
    required T Function(dynamic) fromJson,
    required String method,
  }
  );
  Future<Either<Failure, AuthResponseModel>> registerAsProvider(CreateNewUserParams params);
  Future<Either<Failure, Map<String, String>>> forgetPassword(String phoneNumber);
  Future<Either<Failure, AuthResponseModel>> loginUser(LoginUserParams params);
  Future<Either<Failure, Map<String, String>>> verifyCode(String phoneNumber, String code, String forRegister);
  Future<Either<Failure, Map<String, String>>> resetPassword(String phoneNumber,String code, String password, String passwordConfirmation);
  Future<Either<Failure, String>> editProfile(Editprofileparams params);
}
