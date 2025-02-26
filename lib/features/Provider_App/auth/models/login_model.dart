


class LoginUserParams {
  final String phoneNumber;
  final String password;


  LoginUserParams({required this.phoneNumber,  required this.password, });


  toJson() {
    return {
      "phone": phoneNumber,
      "password": password,
    };
  }
}
