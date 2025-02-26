

class ApiUrls {
  static const String _baseURl = 'http://94.72.98.154/abdulrahim/public/api';
  //https://api.escuelajs.co/api/v1

  // Authorization
  static String registerAsProvider = '$_baseURl/auth/register-as-provider';
  static String login = '$_baseURl/auth/login';
  static String forgetPassword = '$_baseURl/auth/forget-password';
  static String verifyCode = '$_baseURl/auth/verify-code';
  static String resetPassword = '$_baseURl/auth/reset-password';

  //Products and Services

  static String products = '$_baseURl/products';
  static String services = '$_baseURl/services';

  // Profile
  static String profile = '$_baseURl/profile';


}
