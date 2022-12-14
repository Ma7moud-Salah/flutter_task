import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_task/models/product_model.dart';
import 'package:flutter_task/utill/color_resources.dart';

class ProductController extends GetxController {


  var _productList = <ProductModel>[].obs;

  List<ProductModel> get productList => _productList;

   getProductList() {
     _productList = [
       ProductModel(1, 'Whopper', 5,ColorResources.PINK, 17.0, 32.0, 5.0, '','Mega', '27 Des'),
       ProductModel(2, 'Turkish Steak', 5,ColorResources.PINK, 50.0, 50, 5.0, '','small', '22 Des'),
       ProductModel(3, 'Salmon', 3,ColorResources.RED, 35.0, 45.0, 5.0, '','Mega', '30 Des'),
       ProductModel(4, 'Cola', 4,ColorResources.BLUELIGHT, 4.0, 6.0, 5.0, '','Mega', '20 Des'),
       ProductModel(5, 'Chicken', 6,ColorResources.YELLOW, 36.0, 55.0, 5.0, '','Mega', '22 Des'),
       ProductModel(6, 'Red Juice', 2,ColorResources.LIGHT_SKY_BLUE, 7.0, 7.0, 5.0, '','Mega', '30 Des'),
     ].obs;
     //update();
  }

}
