import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_task/controllers/deals_controller.dart';
import 'package:flutter_task/models/deals_model.dart';
import 'package:flutter_task/utill/Sizes/info_widget.dart';

class DealsView extends StatelessWidget {
  DealsView({
    required this.dealsModel,
    Key? key,
  }) : super(key: key);
  final DealsModel dealsModel;
  DealsController dealsController=Get.find<DealsController>();

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context,deviceInfo) {
        return SizedBox(
          width: deviceInfo.screenWidth/1.5,
          child:
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    // color: Colors.green,
                    margin: EdgeInsets.only(left: 12,top: 6),
                   // height: deviceInfo.screenHeight/2,
                    width: deviceInfo.screenWidth/4.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: dealsModel.colors
                    ),
                  ),
                  SizedBox(
                    width:
                    deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/22:deviceInfo.screenHeight/25,
                    height: deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/22:deviceInfo.screenHeight/25,
                    child: FittedBox(
                      child: FloatingActionButton(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        onPressed:  (){
                          dealsController.isFavouriteDeals( dealsModel);
                        },
                        child: Obx(
                              ()=>dealsController.isFavourite[dealsModel.id]==true?
                              Icon(Icons.favorite,size:deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/22:deviceInfo.screenHeight/25,color:Colors.redAccent,):
                              Icon(Icons.favorite_border,size:deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/22:deviceInfo.screenHeight/25,color:Colors.grey.shade300,),
                        ),
                      ),
                    ),
                  )

                ],
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dealsModel.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize:
                      deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/44:deviceInfo.screenHeight/52),),
                    Text(dealsModel.details,style: TextStyle(fontSize:
                    deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/44:deviceInfo.screenHeight/55
                        ,color: Theme.of(context).disabledColor)),
                    //RowIcon
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on,size:
                        deviceInfo.screenWidth/25,color: Theme.of(context).disabledColor,),
                        SizedBox(width: 7,),
                        Text('${dealsModel.arriveTime} Away',style: TextStyle(fontSize: deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/44:deviceInfo.screenHeight/55,color: Theme.of(context).disabledColor),)
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\$ 13 ',style: TextStyle(fontSize: deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/44:deviceInfo.screenHeight/55,color: Colors.red),),
                        SizedBox(width: 7,),
                        Text('\$ 15 ',
                          style: TextStyle(color: Theme.of(context).disabledColor,fontSize: deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/46:deviceInfo.screenHeight/58,decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
