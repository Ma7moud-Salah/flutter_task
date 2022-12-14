import 'package:flutter/material.dart';

class DealsModel {
  late int _id;
  late String _name;
  late int _categoryId;
  late String _arriveTime;
  late Color _colors;
  late double _unitPrice;
  late double _purchasePrice;
  late String _details;


  DealsModel(
      this._id,
      this._name,
      this._details,
      this._arriveTime,
      this._categoryId,
      this._colors,
      this._unitPrice,
      this._purchasePrice,

     );

  int get id => _id;
  String get name => _name;
  int get categoryId => _categoryId;
  Color get colors => _colors;
  double get unitPrice => _unitPrice;
  double get purchasePrice => _purchasePrice;
  String get details => _details;
  String get arriveTime => _arriveTime;

  DealsModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _name = json['name'];
    _categoryId =json['category_id'] ;
    _unitPrice = json['unit_price'].toDouble();
    _purchasePrice = json['purchase_price'].toDouble();
    _details = json['details'];
    _arriveTime = json['arrive_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category_id'] = categoryId;
    data['arrive_time'] = arriveTime;
    data['colors'] = colors;
    data['unit_price'] = unitPrice;
    data['purchase_price'] = purchasePrice;
    data['details'] = details;


    return data;
  }
}
