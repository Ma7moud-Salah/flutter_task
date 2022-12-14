import 'package:flutter/material.dart';

class ProductModel {
  late int _id;
  late String _name;
  late String _endDate;
  late int _categoryId;
  late int _brandId;
  late Color _colors;
  late double _unitPrice;
  late double _purchasePrice;
  double? _discount;
  late String _details;
  late String _size;


  ProductModel(
      this._id,
      this._name,
      this._categoryId,
      this._colors,
      this._unitPrice,
      this._purchasePrice,
      this._discount,this._details,
      this._size,
      this._endDate

      );

  int get id => _id;
  String get name => _name;
  String get endDate => _endDate;
  int get categoryId => _categoryId;
  Color get colors => _colors;
  double get unitPrice => _unitPrice;
  double get purchasePrice => _purchasePrice;
  double get discount => _discount!;
  String get details => _details;
  String get size => _size;

  ProductModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _colors =json['colors'] ;
    _categoryId =json['category_id'] ;
    _unitPrice = json['unit_price'].toDouble();
    _purchasePrice = json['purchase_price'].toDouble();
    _discount = json['discount'].toDouble();
    _details = json['details'];
    _endDate = json['endDate'];
    _size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category_id'] = categoryId;
    data['colors'] = colors;
    data['unit_price'] = unitPrice;
    data['purchase_price'] = purchasePrice;
    data['discount'] = discount;
    data['details'] = details;
    data['size'] = size;
    data['endDate'] = endDate;

    return data;
  }
}
