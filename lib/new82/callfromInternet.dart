import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class GetDataFromOnline extends StatefulWidget {
  const GetDataFromOnline({Key? key}) : super(key: key);

  @override
  _GetDataFromOnlineState createState() => _GetDataFromOnlineState();
}

class _GetDataFromOnlineState extends State<GetDataFromOnline> {
 var jsonString ;
 bool isLoading = true;
  getData() async{

    var client = http.Client();
    var url = "https://raw.githubusercontent.com/fahimxyz/bangladesh-geojson/master/bd-districts.json";
    Uri uri = Uri.parse(url);
    var data =await client.get(uri);
    if(data.statusCode==200){
      isLoading = false;
    }
  jsonString = jsonDecode(data.body);
 print(jsonString["districts"][0]['bn_name']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading ? Center(child: CircularProgressIndicator()) :
      Text(jsonString["districts"][0]['bn_name']),
    );
  }
}
