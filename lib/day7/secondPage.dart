import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
var data;
var data2;
var data4;
SecondPage({this.data, this.data2, this.data4});
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  data(a,b){
    return Text("$a X $b = ${a*b}");

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.data2),),

        body: Center(
          child: Column(
            children: [
              data(10,1),
              data(10,2),
              data(10,3),
              data(10,4),
              data(10,5),
              data(10,6),
              data(10,7),
              data(10,8),
              data(10,9),
              data(10,10),
            ],
          ),
        ));
  }
}
