import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_task/controllers/cart_controller.dart';
import 'package:flutter_task/models/cart_model.dart';
import 'package:flutter_task/models/product_model.dart';
import 'package:flutter_task/utill/Sizes/info_widget.dart';

class ProductView extends StatelessWidget {
   ProductView({
     required this.productModel,
     required this.index,
    Key? key,
  }) : super(key: key);
   final int index;
  ProductModel productModel;
   CartController cartController=Get.find<CartController>();
   @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      CartModel cartModel=  CartModel(productModel.id, productModel.id, productModel.name, 0, productModel.colors.toString(),  productModel.unitPrice,productModel.size);
        cartController.addToCart(cartModel);
        cartController.setQuantity(true, index,cartModel);
      },
      child: InfoWidget(
        builder: (context,deviceInfo) {
          return Card(
            margin: EdgeInsets.only(bottom: 30),
            color: productModel.colors,
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(15),
              width: double.infinity,
              height:
              deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/5:deviceInfo.screenHeight/5,
             // deviceInfo.screenHeight/5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productModel.size,style: TextStyle(fontWeight:FontWeight.normal,
                      fontSize: deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/57:deviceInfo.screenHeight/62,
                  ),),
                  Text.rich(TextSpan(
                      text: productModel.name.substring(0,productModel.name.length-2).toUpperCase(),
                      style: TextStyle(fontWeight:FontWeight.normal,
                          fontSize: deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/26:deviceInfo.screenHeight/27,),
                      children: <InlineSpan>[
                        TextSpan(
                          text: productModel.name.substring(productModel.name.length-2,productModel.name.length-1).toUpperCase(),
                          style: TextStyle(color: Colors.red),
                        ),
                        TextSpan(
                          text: productModel.name.substring(productModel.name.length-1,productModel.name.length).toUpperCase(),
                        ),
                      ]
                  )),

                  Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    width: deviceInfo.screenWidth/2.8,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\$ ${productModel.unitPrice}',style: TextStyle(fontSize: deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/55:deviceInfo.screenHeight/55,color: Colors.red),),
                        SizedBox(width: 7,),
                        productModel.purchasePrice<=productModel.unitPrice?Container():
                        Text('\$ ${productModel.purchasePrice} ',
                          style: TextStyle(color: Colors.white,fontSize: deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/55:deviceInfo.screenHeight/58,decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ),
                  Text('Available until ${productModel.endDate} ',style: TextStyle(
                      color: Colors.white,
                      fontWeight:FontWeight.normal,fontSize:deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/56:deviceInfo.screenHeight/56,),),

                ],
              ),
            ),
          );
        }
      ),
    );
  }
}