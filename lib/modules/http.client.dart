import "dart:async";
import "dart:convert";
import "package:http/http.dart" as http;
import "../models/models.dart";

class HttpClient {

  Future getAllSexs() async {
    var url = "https://salty-mesa-77909.herokuapp.com/users/sexs";
    return await http.post(url).then((response) {
      return JSON.decode(response.body);
    });
  }

  Future getAllUsers() async {
    var url = "https://salty-mesa-77909.herokuapp.com/users/";
    return await http.post(url).then((response) {
      return JSON.decode(response.body);
    });
  }

  Future getTest() async {
    var body = {
      "id_test": 1,
    };
    String lData = JSON.encode(body);
    Map lHeaders = {"Content-type": "application/json", "Accept": "application/json"};
    var url = "https://salty-mesa-77909.herokuapp.com/tests/id";
    return await http.post(url, body: lData, headers: lHeaders).then((response) {
      return JSON.decode(response.body);
    });
  }

  Future getAllQuestion() async {
    var body = {
      "id_test": 1,
    };
    String lData = JSON.encode(body);
    Map lHeaders = {"Content-type": "application/json", "Accept": "application/json"};
    var url = "https://salty-mesa-77909.herokuapp.com/questions/id";
    return await http.post(url, body: lData, headers: lHeaders).then((response) {
      return JSON.decode(response.body);
    });
  }

  Future logIn(String mail, String password) async {
    var body = {
      "mail": mail,
      "password": password,
    };
    String lData = JSON.encode(body);
    Map lHeaders = {"Content-type": "application/json", "Accept": "application/json"};
    var url = "https://salty-mesa-77909.herokuapp.com/users/id";
    return await http.post(url, body: lData, headers: lHeaders).then((response) {
      return JSON.decode(response.body);
    });
  }

  Future signUp(User user) async {
    var body = {
      "mail": user.mail,
      "password": user.password,
      "birthday": user.birthday.toString(),
      "id_sex": user.idSexs,
      "first_name": user.firstName,
      "last_name": user.lastName,
      "city": user.city
    };
    String lData = JSON.encode(body);
    Map lHeaders = {"Content-type": "application/json", "Accept": "application/json"};
    var url = "https://salty-mesa-77909.herokuapp.com/users/logup";
    return await http.post(url, body: lData, headers: lHeaders).then((response) {
      return JSON.decode(response.body);
    });
  }
}