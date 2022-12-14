import 'package:flutter/material.dart';

class CategoryModel{
   late int _id;
   late String _name;
   late Color _colors;


  CategoryModel(
      this._id,
      this._name,
      this._colors,

      );

  int get id => _id;
  String get name => _name;
  Color get colors => _colors;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _colors =json['colors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['colors'] = this.colors;
    return data;
  }
}