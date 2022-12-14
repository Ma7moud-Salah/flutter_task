import 'package:flutter/material.dart';

class CartModel{
  late int _id;
  late String _name;
  late int _quantity;
  late int _productId;
  late String _colors;
  late double _discountedPrice;
  late String _size;


  CartModel(
      this._id,
      this._productId,
      this._name,
      this._quantity,
      this._colors,
      this._discountedPrice,
      this._size,

      );
  set quantity(int value) {
    _quantity = value;
  }
  int get id => _id;
  String get name => _name;
  int get quantity => _quantity;
  String get colors => _colors;
  double get discountedPrice => _discountedPrice;
  int get productId => _productId;

  String get size => _size;

  CartModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _colors =json['colors'] ;
    _quantity =json['quantity'] ;
    _discountedPrice = json['discounted_price'].toDouble();
    _productId = json['product_id'];
    _size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['quantity'] = quantity;
    data['colors'] = colors;
    data['discounted_price'] = discountedPrice;
    data['product_id'] = productId;
    //data['discount'] = discount;
    //data['details'] = details;
    data['size'] = size;
    return data;
  }
}