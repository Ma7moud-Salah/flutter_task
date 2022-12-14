import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_task/helper/cache_helper.dart';
import 'package:flutter_task/models/cart_model.dart';
import 'package:flutter_task/utill/app_constants.dart';
class CartController extends GetxController{
int counter=0;
var _cartList = <CartModel>[].obs ;
var isSelectedList = <bool>[].obs;
var amount = 0.0.obs;
var quantity = 0.obs;
var quantityMap =<int,int>{}.obs;
var _isAddedToCart ={};
late CartModel cart;
List<CartModel> get cartList => _cartList;


void addToCart(CartModel cartModel) {

    if(!_isAddedToCart.containsKey(cartModel.id)){
      _cartList.add(cartModel);
      _isAddedToCart.addAll({cartModel.id:true});

    }

    amount.value =( amount.value + (cartModel.discountedPrice * cartModel.quantity));
    addToCartList(_cartList);

}


getCartList() {
  _cartList=<CartModel>[].obs;
  quantityMap=<int,int>{}.obs;
  _isAddedToCart={};
  if(CacheHelper.sharedPreferences.containsKey(AppConstants.CART_LIST)){
    List<String>? carts = CacheHelper.getStringList(AppConstants.CART_LIST);
  List<CartModel> innerCartList = [];
  carts!.forEach((cart) => _cartList.add(CartModel.fromJson(jsonDecode(cart))) );
  _cartList.addAll(innerCartList);
    amount.value=0;
  _cartList.forEach((element) {
    _isAddedToCart.addAll({element.id:element.quantity});
    amount.value =(amount.value+(element.discountedPrice * element.quantity));
    quantityMap.addAll({element.id:element.quantity});
  });

  }else{
    _cartList.clear();//=<CartModel>[].obs;
     quantityMap.clear();
    _isAddedToCart.clear();
  }

}
void addToCartList(List<CartModel> cartProductList) {
  List<String> carts = [];
  if(CacheHelper.sharedPreferences.containsKey(AppConstants.CART_LIST)){
    CacheHelper.removeData(key:AppConstants.CART_LIST ).then((value) {
      cartProductList.forEach((cartModel) => carts.add(jsonEncode(
          cartModel.toJson()//{'id': 0, 'name': 'Whopper', 'quantity': 1, 'colors': 'Color(0xfffec8bd)', 'discounted_price': 17.0, 'product_id': 0, 'size': 'Mega'}
      )) );
      CacheHelper.saveStringList(key:AppConstants.CART_LIST,value: carts).then((value) {});
    });
     }
  else{

    cartProductList.forEach((cartModel) => carts.add(jsonEncode(
        cartModel.toJson()//{'id': 0, 'name': 'Whopper', 'quantity': 1, 'colors': 'Color(0xfffec8bd)', 'discounted_price': 17.0, 'product_id': 0, 'size': 'Mega'}
    )) );
    CacheHelper.saveStringList(key:AppConstants.CART_LIST,value: carts).then((value) {});
  }
}
void getCartData() {
  _cartList = <CartModel>[].obs;
   isSelectedList = <bool>[].obs;
  _cartList.addAll(getCartList()??[]);
  _cartList.forEach((cart) {
    isSelectedList.add(true);
    //amount = (amount.value + (cart.discountedPrice * cart.quantity!)).obs;
  });
}
void setQuantity(bool isIncrement, int indexm,CartModel cartModel) {
  if (isIncrement) {
    cartModel.quantity = cartModel.quantity + 1;
    if(quantityMap.containsKey(cartModel.id)){
      quantityMap.update(cartModel.id, (value) => cartModel.quantity);
    }else{
      quantityMap.addAll({cartModel.id: cartModel.quantity});
    }
    } else {
    cartModel.quantity = cartModel.quantity - 1;
    if(cartModel.quantity==0){
      _isAddedToCart.remove(cartModel.id);
       quantityMap.remove(cartModel.id);
      _cartList.remove(cartModel);

     }else{
      if(quantityMap.containsKey(cartModel.id)){

        quantityMap.update(cartModel.id, (value) => cartModel.quantity );
      }else{
        quantityMap.addAll({cartModel.id: cartModel.quantity});
      }
    }
    if(_cartList.isEmpty){

    }
  }
  addToCartList(_cartList);
  amount.value=0;
  _cartList.forEach((element) {
    amount.value =(amount.value+(element.discountedPrice * element.quantity));
  });

}
void updateCartProductQuantity(){

}
Color convertStringToColor(colorString){// Color(0x12345678)
  String valueString = colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
  int value = int.parse(valueString, radix: 16);
  Color otherColor = new Color(value);
  return otherColor;
}
}