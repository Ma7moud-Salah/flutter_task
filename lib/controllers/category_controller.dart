import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_task/models/category_model.dart';
import 'package:flutter_task/utill/color_resources.dart';

class CategoryController extends GetxController {


  var _categoryList = <CategoryModel>[].obs;

  List<CategoryModel> get categoryList => _categoryList;

   getCategoryList() {
     _categoryList = [
       CategoryModel(0, 'Steak', ColorResources.PINK),
       CategoryModel(1, 'Vegetables', ColorResources.YELLOW),
       CategoryModel(2, 'Beverages', ColorResources.BLUE),
       CategoryModel(3, 'Fish', ColorResources.BLUELIGHT),
       CategoryModel(4, 'Juice', ColorResources.RED),
       CategoryModel(5, 'Meat', ColorResources.PINK),
       CategoryModel(6, 'Chicken', ColorResources.PINK),
     ].obs;
     //update();
  }


}
