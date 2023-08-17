import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> postData(name, pass, mobile) async {
  final response = await http.post(
    Uri.parse('http://127.0.0.1:8000/'),
    body: {
      'name': name,
      'password': pass,
      'mobile': mobile,
    },
  );

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    // Handle the response data as needed
    // print('Response data: $responseData');
  } else {
    // Handle error
    print('Request failed with status: ${response.statusCode}');
  }
}
