//import 'package:http/http.dart' as http;

class ApiRequest {
  final String url;
  final Map<String, dynamic>? body;
   final bool allowCancel;

  ApiRequest({
    required this.url,
     this.body,
    this.allowCancel=true,

  });

  
}


