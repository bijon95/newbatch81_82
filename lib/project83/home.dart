import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final Controller _controller = Get.put(Controller());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.fatchCatData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx((){
        if(_controller.isLoadingCategory.value){
          return CircularProgressIndicator();
        }
        else{
        return  ListView.builder(
            itemCount: _controller.catList.length,
            itemBuilder: (BuildContext ctx, int index){
          return Text(_controller.catList[index].name);

        });
        }
      })
    );
  }
}
