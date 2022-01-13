import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'login.dart';
class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

var msg = '';
  newUserReg() async{
    String url = "https://happybuy.appsticit.com/registration";
    Uri uri = Uri.parse(url);
    Map data = {
      'name' : _ctName.text,
      'password' : _ctPass.text,
      'phone': _ctPhone.text,
      'type':"user",
      "token":"1234",
    };

    var jsonData = json.encode(data);
    var response = await http.post(uri,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonData,
    );

    print(response.statusCode);
    print(response.body);
    var returnData = jsonDecode(response.body);
    msg = returnData['msg'];

    setState(() {

    });
  }


  TextEditingController _ctName = TextEditingController();
  TextEditingController _ctPhone = TextEditingController();
  TextEditingController _ctPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Name"
          ),
          controller: _ctName,
        ),
        TextField(
          decoration: InputDecoration(
              hintText: "Phone"
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
            newUserReg();
          },
          child: Container(
            alignment: Alignment.center,
            height: 45,
            width: 100,
            color: Colors.blue,
            child: Text("Registration",style: TextStyle(color: Colors.white),),
          ),
        ),
        Text(msg),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=> Login()));

        }, child: Text("Already Have an Account ?"))

      ],),
    );
  }
}
