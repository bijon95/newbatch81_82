import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled/project83/registration.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  var msg = '';

    loginReq()async{
       String url = "https://happybuy.appsticit.com/user_login";
       Uri uri = Uri.parse(url);
       Map data = {
         'phone':_ctPhone.text,
         'password': _ctPass.text,
       };

       var jsonData = json.encode(data);

       var response = await http.post(
           uri,
           headers: {
             'Content-Type': 'application/json',
           },
           body: jsonData);

       print(response.statusCode);
       print(response.body);
       var returndata = jsonDecode(response.body);
       var status =returndata["status"];
       msg = returndata["msg"];
if(status=="success"){
  Navigator.pop(context);
  Navigator.push(context, MaterialPageRoute(builder: (builder)=> Home()));
}

setState(() {

});

    }


  TextEditingController _ctPhone = TextEditingController();
  TextEditingController _ctPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextField(
          decoration: InputDecoration(
              hintText: "phone"
          ),
          controller: _ctPhone,
        ),
        TextField(
          decoration: InputDecoration(
              hintText: "Pass"
          ),
          controller: _ctPass,
        ),
        InkWell(
          onTap: (){
            loginReq();
          },
          child: Container(
            alignment: Alignment.center,
            height: 45,
            width: 100,
            color: Colors.blue,
            child: Text("Login",style: TextStyle(color: Colors.white),),
          ),
        ),
        Text(msg),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=> Registration()));
        }, child: Text("Create a New Account"))

      ],),
    );
  }
}
