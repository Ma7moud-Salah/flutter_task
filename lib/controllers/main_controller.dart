import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_task/controllers/cart_controller.dart';
import 'package:flutter_task/views/screen/cart/cart_screen.dart';
import 'package:flutter_task/views/screen/home/home.dart';

class MainController extends GetxController {
  List<Widget> buildScreens() {
    return [
      HomeScreen(),
      Container(
        color: Colors.red,
      ),
      HomeScreen(),
      Container(
        color: Colors.blue,
      ),
      CartScreen()
    ];
  }
  List<PersistentBottomNavBarItem> navBarsItems() {
    CartController cartController=Get.find<CartController>();
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_work_outlined),
        title: ("Home"),
        activeColorPrimary: Colors.redAccent,
        inactiveColorPrimary: Colors.grey,
      ),PersistentBottomNavBarItem(
        icon: Icon(Icons.notifications_none),
        title: ("News"),
        activeColorPrimary: Colors.redAccent,
        inactiveColorPrimary: Colors.grey,
      ),PersistentBottomNavBarItem(
        icon: //Obx(()=>
        Column(
          children: [
            Obx(()=>
                Text(cartController.amount.value.toString(),style: TextStyle(color: Colors.white,fontSize: 11),),
            ),
            Icon(Icons.shopping_cart,color: Colors.white,)
          ],
          // ),
        ),
        activeColorPrimary: Colors.redAccent,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite_border),
        title: ("Favourite"),
        activeColorPrimary: Colors.redAccent,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.bookmarks),
        title: ("Cart"),
        activeColorPrimary: Colors.redAccent,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

}
