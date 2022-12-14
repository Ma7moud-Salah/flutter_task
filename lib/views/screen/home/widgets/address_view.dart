import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/models/address_model.dart';
import 'package:flutter_task/models/product_model.dart';
import 'package:flutter_task/utill/Sizes/info_widget.dart';
import 'package:flutter_task/utill/color_resources.dart';

class AddressView extends StatelessWidget {
   AddressView({
     required this.addressModel,
    Key? key,
  }) : super(key: key);
  AddressModel addressModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InfoWidget(
        builder: (context,deviceInfo) {
          return Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
            ),
            child:
            Row(
              children: [
                Container(
                  // color: Colors.green,
                  height: deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/11:deviceInfo.screenHeight/14,
                  width: deviceInfo.screenWidth/7.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorResources.LIGHTGREY
                  ),
                ),
                SizedBox(width: 5,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(addressModel.addressType,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/42:deviceInfo.screenHeight/63),
                      ),
                      Text('${addressModel.streetName} , ${addressModel.streetDetails}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/46:deviceInfo.screenHeight/67,color: Theme.of(context).disabledColor)),
                      addressModel.floorNumber!=0?
                      Text('Floor: ${addressModel.floorNumber} , ${addressModel.floorDetails}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:  TextStyle(fontSize: deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/46:deviceInfo.screenHeight/67,color: Theme.of(context).disabledColor))
                      :Text('${addressModel.floorDetails}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:  TextStyle(fontSize: deviceInfo.orientation==Orientation.landscape?deviceInfo.screenWidth/46:deviceInfo.screenHeight/67,color: Theme.of(context).disabledColor)),

    ],
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}