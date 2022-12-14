import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_task/models/address_model.dart';

class AddressController extends GetxController {


   AddressModel _homeAddress=AddressModel(0, 'Home Address', 'address', 'Cairo', 'Street x12', 'Egypt', 'Mustafa St', 'No : 2', 0);
   AddressModel _officeAddress=AddressModel(1, 'Office Address', 'address', 'Cairo', 'Office 11', 'Egypt', 'Axis Istanbul ', 'B2 Blok', 2);

   AddressModel get getHomeAddress=>_homeAddress;
   AddressModel get getOfficeAddress=>_officeAddress;

}
