import 'package:salon_app/core/network/failure.dart';
import 'package:salon_app/features/Provider_App/auth/models/Auth_response.dart';

class AuthnticationState {
  final bool isLoading;
  final String? error;
  final bool haveAccess;
  final bool errorChangingPassword;
  final String? accessToken;
  final bool verfiyCode;
  final AuthResponseModel? authData;
  final Failure? failure;
  final bool errorWithLogin;


  AuthnticationState(
      {this.verfiyCode = false,
      this.isLoading = false,
      this.error,
      this.haveAccess = false,
      this.accessToken,
      this.authData,
      this.failure,
      this.errorChangingPassword= false,
      this.errorWithLogin = false
      
      });

  AuthnticationState copyWith(
      {bool? isLoading,
      String? error,
      bool? haveAccess,
      String? accessToken,
      bool? verfiyCode,
      AuthResponseModel? authData,
      Failure? failure,
      bool? errorChangingPassword,
      bool? errorWithLogin

      }) {
    return AuthnticationState(
        isLoading: isLoading ?? false,
        verfiyCode: verfiyCode ?? false,
        error: error,
        haveAccess: haveAccess ?? false,
        accessToken: accessToken ?? this.accessToken,
        authData: authData ?? this.authData,
        failure: failure,
        errorChangingPassword : errorChangingPassword ?? false,
        errorWithLogin : errorWithLogin ?? false
        );
  }
}
