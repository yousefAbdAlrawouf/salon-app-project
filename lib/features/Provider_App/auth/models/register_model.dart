class CreateNewUserParams {
  final String phoneNumber;
  final String email;
  final String password;
  final String passwordConfirm;
  final String? gender;
  final String name;
  final String image;

  CreateNewUserParams(
    this.image,
    this.phoneNumber,
    this.email,
    this.password,
    this.gender,
    this.name,
    this.passwordConfirm,
  );

  Map<String, dynamic> toJson() {
    return {
      'phone': phoneNumber,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirm,
      'type': gender == 'male' ? '1' : '2',
      'name': name,
      "ar": {"name": name},
      "en": {"name": name}
    };
  }
}
