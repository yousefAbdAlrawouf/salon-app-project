import 'package:salon_app/features/Provider_App/auth/models/Auth_response.dart';

class AppManagerState {
  final AuthResponseModel? authResponseModel;
   bool? isLogOutSuccess;

  AppManagerState({this.authResponseModel,this.isLogOutSuccess=false});

  AppManagerState copyWith({
    AuthResponseModel? authResponseModel,
    bool? isLogOutSuccess
  }) {
    return AppManagerState(
      authResponseModel: authResponseModel ?? this.authResponseModel,
      isLogOutSuccess: isLogOutSuccess ?? false
    );
  }
}
