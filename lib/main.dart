import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_task/controllers/address_controller.dart';
import 'package:flutter_task/controllers/category_controller.dart';
import 'package:flutter_task/controllers/cart_controller.dart';
import 'package:flutter_task/controllers/deals_controller.dart';
import 'package:flutter_task/controllers/main_controller.dart';
import 'package:flutter_task/controllers/product_controller.dart';
import 'package:flutter_task/helper/cache_helper.dart';
import 'package:flutter_task/views/screen/home/home.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(DevicePreview(builder:(context)=> const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      Get.put(CartController());
      Get.put(MainController());
      Get.put(CategoryController());
      Get.put(ProductController());
      Get.put(AddressController());
      Get.put(DealsController());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ControllerScreen(),
    );
  }
}




