import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthController {
  final String baseUrl = 'http://localhost:1702/api/v1/users';

  Future<String?> login(String email, String password, {int roleId = 1}) async {
    final String apiUrl = '$baseUrl/login';

    final Map<String, dynamic> data = {
      "email": email,
      "password": password,
      "role_id": roleId
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData['token'];
      } else {
        print('Login Failed. Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Exception during login: $e');
      return null;
    }
  }

  //Register
  // final String apiUrl = '$baseUrl/register';

  Future<String?> register(
    String username,
    String email,
    String password,
    String address,
    String phone,
    DateTime? birthday,
  ) async {
    final String apiUrl = '$baseUrl/register';
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> body = {
      'username': username,
      'email': email,
      'password': password,
      'address': address,
      'phone': phone,
      'birthday': birthday?.toString() ?? '',
      'facebook_account_id': 0,
      'google_account_id': 0,
      'role_id': 1,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return 'success';
      } else {
        // Đăng ký thất bại
        print('Lỗi đăng ký: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Lỗi không xác định: $e');
      return null;
    }
  }
}
