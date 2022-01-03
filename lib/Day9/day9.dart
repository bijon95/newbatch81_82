import 'package:flutter/material.dart';

class Day9 extends StatefulWidget {
  const Day9({Key? key}) : super(key: key);

  @override
  _Day9State createState() => _Day9State();
}

class _Day9State extends State<Day9> {

  TextEditingController ct = TextEditingController();

  String data ="" ;

   fun(){
    data = ct.text;
    setState(() {
    });
  }

  txtChange(val){
     data = val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              onChanged: txtChange,
              controller: ct,
              decoration: InputDecoration(
                labelText: "Email",
                
              ),
            ),
            InkWell(
              onTap: (){
                if(ct.text!=11){
                  data = "Please input correct number";
                }
                setState(() {

                });
              }, child: Container(
              height: 40,
              width: 150,
              color: Colors.grey,
child: Text("Login"),
            )),
            Text(data),

          ],
        ),
      ),
    );
  }
}
