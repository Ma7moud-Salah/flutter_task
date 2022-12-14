import 'package:flutter/material.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          clipBehavior: Clip.antiAlias,
          shape: BeveledRectangleBorder(
            // side: BorderSide(color: Colors.blue), if you need
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                //    bottomRight: Radius.circular(20.0)
              )),
          child:
          Container(
            padding: EdgeInsets.all(7),
            height: 40,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              children: [
                Icon(Icons.location_on,color: Colors.white,),
                SizedBox(width: 5,),
                Text('Egypt',style: TextStyle(color: Colors.white,),)
              ],
            ),
          ),
        ),

        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              shape: BoxShape.circle
          ),
        )
      ],
    );
  }
}