
class Editprofileparams {
  final String name;
  final String email;
  final String phone;
  final String gender;

  Editprofileparams(this.name, this.email, this.phone, this.gender);

  Map<String, String> toJson() {
    return {'name': name, 'email': email, 'phone': phone, 'gender': gender};
  }
}
