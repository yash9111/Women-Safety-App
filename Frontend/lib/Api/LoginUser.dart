import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

Future<bool> loginUser(String mobileNumber, String password) async {
  final String baseUrl = 'http://127.0.0.1:8000/';
  final dio = Dio();
  try {
    final response = await http
        .get(Uri.parse('$baseUrl?mobile=$mobileNumber&password=$password'));
    print("Status code is =" + response.statusCode.toString());
    // final response = await dio.get(
    //   '$baseUrl',
    //   queryParameters: {'mobile': mobileNumber, 'password': password},
    // );
    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  } catch (e) {
    String str = e.toString();
    print("error occured : $str");
    // print(e.stackTrace);
  }
  return true;
}
