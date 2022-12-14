import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_task/models/category_model.dart';
import 'package:flutter_task/utill/Sizes/info_widget.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({
    required this.categoryModel,
    Key? key,
  }) : super(key: key);
  CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return InfoWidget(
        builder: (context,deviceInfo) {
          return Column(
          children: [
           Expanded(
             child: Container(
                    decoration: BoxDecoration(
                        color: categoryModel.colors,
                        borderRadius:BorderRadius.circular(15)
                    ),

              ),
           ),
            SizedBox(height: 10,),
            Text(categoryModel.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12))
          ],);
        });
  }
}
