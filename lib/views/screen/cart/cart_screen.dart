
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_task/controllers/cart_controller.dart';
import 'package:flutter_task/helper/cache_helper.dart';
import 'package:flutter_task/models/cart_model.dart';
import 'package:flutter_task/utill/app_constants.dart';
import 'package:flutter_task/utill/color_resources.dart';
import 'package:flutter_task/utill/dimensions.dart';
import 'package:flutter_task/views/base_widget/app_bar_widget.dart';
import 'package:flutter_task/views/screen/cart/widget/cart_widget.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);
   CartController cartController=Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //AppBar
            AppBarView(),
            SizedBox(height: 20,),
            InkWell(
                onTap: (){
    CacheHelper.removeData(key:AppConstants.CART_LIST );},
                child: Text('Cart')),
            Expanded(child:
            Obx(
              ()=> ListView.separated(
                  itemBuilder: (context,index){
                    return CartView(cartModel: cartController.cartList[index],index: index,);
                  }, separatorBuilder: (context,index){
                    return SizedBox(height: 20,);
              }, itemCount:  cartController.cartList.length),
            ))
          ],
        ),
      ),
    )
    );
  }
}



