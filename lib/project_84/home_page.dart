import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/project_84/controller.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final Controller _controller = Get.put(Controller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.fatchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        if(_controller.isLoadingProduct.value){
          return CircularProgressIndicator();
        }

        else{
          return ListView.builder(
              itemCount:_controller.productList.length,
              itemBuilder: (ctx, int){
                return Container(
                  child: Text(_controller.productList[int].name),
                );
              });
        }


      })
    );
  }
}
