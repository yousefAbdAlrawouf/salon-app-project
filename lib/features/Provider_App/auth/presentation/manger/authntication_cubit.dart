import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/features/Provider_App/auth/data/abstract_auth_remote.dart';
import 'package:salon_app/features/Provider_App/auth/models/editProfileParams.dart';
import 'package:salon_app/features/Provider_App/auth/models/login_model.dart';
import 'package:salon_app/features/Provider_App/auth/models/register_model.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_state.dart';

class AuthnticationCubit extends Cubit<AuthnticationState> {
  final AuthRemoteDataSource remote;

  AuthnticationCubit(this.remote) : super(AuthnticationState());

  signUp(CreateNewUserParams params) async {
    emit(state.copyWith(isLoading: true));
    final response = await remote.registerAsProvider(params);

    response.fold((failure) {
      emit(state.copyWith(failure: failure));
    }, (data) {
      emit(state.copyWith(authData: data));
    });
  }

  forgetPassword(String phoneNumber) async {
    emit(state.copyWith(isLoading: true));
    final result = await remote.forgetPassword(phoneNumber);
    result.fold((failure) {
      log(failure.message);
      emit(state.copyWith(error: failure.message));
    }, (user) {
      log("Code Sent Successfully");
      emit(state.copyWith(haveAccess: true));
    });
  }

  verifyCode(String phoneNumber, String code, String for_register) async {
    emit(state.copyWith(isLoading: true));
    final result = await remote.verifyCode(phoneNumber, code, for_register);
    result.fold((failure) {
      log(failure.message);
      emit(state.copyWith(error: failure.message));
    }, (user) {
      log("Code Verifyed Successfully");
      emit(state.copyWith(verfiyCode: true));
    });
  }

  resetPassword(String phoneNumber, String code, String password,
      String confirmPassword) async {
    emit(state.copyWith(isLoading: true));
    final result = await remote.resetPassword(
        phoneNumber, code, password, confirmPassword);
    result.fold((failure) {
      log(failure.message);
      emit(state.copyWith(error: failure.message));
    }, (user) {
      log("Password Changed Successfully");
      emit(state.copyWith(haveAccess: true));
    });
  }

  editProfile(Editprofileparams parmas) async {
    emit(state.copyWith(isLoading: true));

    final result = await remote.editProfile(parmas);

    result.fold((failure) {
      log(failure.message);
      emit(state.copyWith(error: failure.message,errorChangingPassword: true));
    }, (user) {
      log("Profile Edited Successfully");
      emit(state.copyWith(haveAccess: true));
    });
  }

  void logIn(LoginUserParams params) async {
    emit(state.copyWith(isLoading: true));
    log("Hello im here");
    final result = await remote.loginUser(params);

    result.fold(
      (error) {
        log("Phone Or Password Wrong");
        emit(state.copyWith(failure: error,errorWithLogin: true));
        log(error.message);
      },
      (data) {
        log("Success To Login ");
        emit(state.copyWith(
            haveAccess: true, authData: data,accessToken: data.token));
      },
    );
  }
}
