import 'package:flutter/material.dart';
class TestSetState extends StatelessWidget {

  var txt = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(txt),
          InkWell(
            onTap: (){
              txt='1';


            },
            child: Container(
              height: 40,
              width: 40,
              color: Colors.grey,
              child: Text('1'),
            ),
          ),
        ],
      ),
    );
  }
}
