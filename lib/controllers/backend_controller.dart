import 'dart:convert';

import 'package:bar_social_app/utils/constants.dart';
import 'package:http/http.dart' as http;

//http://192.168.1.26:5000/ws-users/login
//http://192.168.1.26:5000/ws-users/register
//GET http://192.168.1.26:5000/ws-users/photo
//POST http://192.168.1.26:5000/ws-users/photo
//PUT http://192.168.1.26:5000/ws-users/photo

Future<dynamic> login(username, password) async {
  var response = await http.post(Uri.parse(BACKEND_URL + "/ws-users/login"),
      body: (json.encode({"username": username, "password": password})),
      headers: {"Content-Type": "application/json"});
  var res = json.decode(response.body);

  String token = res["token"];
  //TODO: almacenar este token en el localstorage
  return res;
}

//Debo checkear el login

Future<dynamic> register(
  name,
  lastName,
  email,
  age,
  photo,
  username,
  password,
) async {
  var response = await http.post(Uri.parse(BACKEND_URL + "/ws-users/register"),
      body: (json.encode({
        "name": name,
        "lastname": lastName,
        "email": email,
        "age": age,
        "photo": photo,
        "username": username,
        "password": password
      })),
      headers: {"Content-Type": "application/json"});

  var res = json.decode(response.body);
  return res;
}
