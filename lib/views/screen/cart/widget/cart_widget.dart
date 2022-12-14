import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_task/controllers/cart_controller.dart';
import 'package:flutter_task/models/cart_model.dart';
import 'package:flutter_task/utill/dimensions.dart';
import 'package:flutter_task/views/screen/cart/widget/quantity_button.dart';

class CartView extends StatelessWidget {
  CartView({
    Key? key,
    required this.cartModel,
    required this.index,
  }) : super(key: key);

  final CartModel cartModel;
  final int index;
  CartController cartController=Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
      // padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
      child:
      Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 60,
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment:  MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 60, width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL),
                        color: cartController.convertStringToColor(cartModel.colors),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartModel.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12),),
                        Text(cartModel.size,style: TextStyle(fontSize: 10,color: Theme.of(context).disabledColor)),
                        Text('\$ ${cartModel.discountedPrice}',style:  TextStyle(fontSize: 12,color: Colors.red)),

                      ],
                    )



                  ]),
            ),
          ),
          SizedBox(width: 20,),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
                child: QuantityButton(isIncrement: false,
                  index: index,//index,
                  quantity: 0,//cartController.counter,
                  maxQty: 20,
                    cartModel: cartModel,
                  //  minimumOrderQuantity: cartModel.productInfo.minimumOrderQty??0,
                  digitalProduct:true,

                ),
              ),
              Obx(
               ()=> Text('${cartController.quantityMap[cartModel.id]}',//cartController.counter.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),

              Padding(
                padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                child:
                QuantityButton(index: index,
                  isIncrement: true,
                  quantity: cartModel.quantity,
                  maxQty: 20,
                   cartModel: cartModel,
                  minimumOrderQuantity: 1,
                  digitalProduct: false,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
