import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/project_84/controller.dart';
import 'package:untitled/project_84/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var ctPhone = TextEditingController();
  var ctPassword = TextEditingController();
  var msg = '';
  loginReq() async {
    String url = 'https://happybuy.appsticit.com/user_login';
    Uri uri = Uri.parse(url);
    Map data = {
      'phone': ctPhone.text,
      'password': ctPassword.text,
    };

    var body = json.encode(data);

    var response = await http.post(uri, body: body, headers: {
      'Content-Type': 'application/json',
    });

    print(response.statusCode);
    print(response.body);
    var jsonString = jsonDecode(response.body);
    msg = jsonString['msg'];
    if(jsonString['status']=='success'){
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (builder)=>HomePage()));
    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: ctPhone,
            ),
            TextField(
              controller: ctPassword,
            ),
            Text(msg),
            MaterialButton(
              onPressed: () {
                loginReq();
              },
              child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
