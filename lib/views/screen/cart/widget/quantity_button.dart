import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_task/controllers/cart_controller.dart';
import 'package:flutter_task/models/cart_model.dart';
import 'package:flutter_task/utill/color_resources.dart';

class QuantityButton extends StatelessWidget {
  final CartModel cartModel;
  final bool isIncrement;
  final int quantity;
  final int index;
  final int maxQty;
  final int? minimumOrderQuantity;
  final bool? digitalProduct;
  QuantityButton({required this.isIncrement, required this.quantity, required this.index,
    required this.maxQty,
    required this.cartModel,
    this.minimumOrderQuantity, this.digitalProduct});
  CartController cartController=Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isIncrement) {
          cartController.setQuantity(false, index,cartModel);
        }else if ((isIncrement)) {
          cartController.setQuantity(true, index,cartModel);
        }
      },
      child: Icon(
        isIncrement ? Icons.add_circle : Icons.remove_circle,
        color: isIncrement
            ?  quantity >= maxQty && !digitalProduct!?  Colors.grey
            : ColorResources.BLUE
            : quantity > 1
            ?  Colors.grey
            :  ColorResources.BLUE,
        size: 30,
      ),
    );
  }
}
