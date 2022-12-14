import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_task/models/deals_model.dart';
import 'package:flutter_task/utill/color_resources.dart';

class DealsController extends GetxController {


  var _dealsList = <DealsModel>[].obs;
  var isFavourite =<int,bool>{}.obs;
  List<DealsModel> get dealsList => _dealsList;

  getDealsList() {
     _dealsList = [
       DealsModel(0,'Summer Sun Ice Cream Pack', '5 Pieces','15 Minutes', 2, ColorResources.CERISE, 12.0, 18.0),
       DealsModel(1,'Turkish Steak', '3 Pieces','25 Minutes', 5, ColorResources.PINK, 120.0, 150.0),
       DealsModel(2,'Salmon', '3 Pieces','20 Minutes', 3, ColorResources.RED, 100.0, 135.0),
       DealsModel(3,'Cola', '10 Pieces','15 Minutes', 4, ColorResources.BLUELIGHT, 30.0, 40.0)
     ].obs;
     //update();
  }
  isFavouriteDeals(DealsModel dealsModel){
    if(isFavourite.keys.contains(dealsModel.id)){
      isFavourite[dealsModel.id]=!(isFavourite[dealsModel.id]!);
      isFavourite.update(dealsModel.id, (value) => isFavourite[dealsModel.id]!);

    }else{
      isFavourite.addAll({dealsModel.id:true});
    }
  }

}
