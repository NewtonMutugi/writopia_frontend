import 'dart:convert';

import 'package:writopia_frontend/constants/constants.dart';
import 'package:writopia_frontend/models/user.dart';
import 'package:http/http.dart';

Future<User?> signUpUser(User u) async {
  try {
    var response = await post(
      Uri.parse("$urlPrefix/users/register/"),
      headers: defaultHeader,
      body: json.encode(u.toJson()),
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    }

    showErrorMessage(
      "Sign Up Error",
      json.decode(response.body)["message"],
    );
  } catch (e) {
    showErrorMessage(
      "Exception",
      e.toString(),
    );
  }
  return null;
}
