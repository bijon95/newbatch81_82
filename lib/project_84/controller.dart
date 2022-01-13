

import 'package:get/get.dart';
import 'package:untitled/project_84/remote_service.dart';

import 'Model/productModel.dart';

class Controller extends GetxController{

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fatchProduct();
  }
  var productList= List<Product>.empty().obs;
  var isLoadingProduct = true.obs;

  fatchProduct()async{

    try{
      isLoadingProduct(true);
      var productdata = await RemoteService.getProduct();
      if(productdata!=null){
        productList.value = productdata;
      }

    }
    finally{
      isLoadingProduct(false);
    }

  }


}