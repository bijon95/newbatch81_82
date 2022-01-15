import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';
class CallFromApi extends StatefulWidget {
  const CallFromApi({Key? key}) : super(key: key);

  @override
  _CallFromApiState createState() => _CallFromApiState();
}

class _CallFromApiState extends State<CallFromApi> {

  var postOfficeList = List<Postcode>.empty();

 Future<List<Postcode>> callApi()async{
    String url = "https://raw.githubusercontent.com/fahimxyz/bangladesh-geojson/master/bd-postcodes.json";
    Uri uri = Uri.parse(url);
    var responce = await http.get(uri);



      var data = jsonDecode(responce.body);
      var postdata = json.encode(data['postcodes']);
print(postdata);
      return postcodeFromJson(postdata);

  }

  fatchPostCode()async{
    postOfficeList   = await callApi();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: (){
          fatchPostCode();
        },
        child: Text("Get Api Data"),
      ),
    );
  }
}
