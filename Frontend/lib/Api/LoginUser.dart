
import 'package:http/http.dart' as http;

Future<bool> loginUser(String mobileNumber, String password) async {
  final String baseUrl = 'http://127.0.0.1:8000/';
  try {
    final response = await http
        .get(Uri.parse('$baseUrl?mobile=$mobileNumber&password=$password'));
    // print("Status code is =" + response.statusCode.toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    String str=e.toString();
    print("error occured : $str");
  }
  return false;
}
