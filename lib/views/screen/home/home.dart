import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_task/controllers/address_controller.dart';
import 'package:flutter_task/controllers/address_controller.dart';
import 'package:flutter_task/controllers/cart_controller.dart';
import 'package:flutter_task/controllers/category_controller.dart';
import 'package:flutter_task/controllers/deals_controller.dart';
import 'package:flutter_task/controllers/main_controller.dart';
import 'package:flutter_task/controllers/product_controller.dart';
import 'package:flutter_task/models/category_model.dart';
import 'package:flutter_task/models/deals_model.dart';
import 'package:flutter_task/utill/Sizes/info_widget.dart';
import 'package:flutter_task/utill/Sizes/model/device_info.dart';
import 'package:flutter_task/utill/Sizes/model/device_type.dart';
import 'package:flutter_task/utill/color_resources.dart';
import 'package:flutter_task/views/base_widget/app_bar_widget.dart';
import 'package:flutter_task/views/screen/cart/cart_screen.dart';
import 'package:flutter_task/views/screen/home/widgets/address_view.dart';
import 'package:flutter_task/views/screen/home/widgets/categories_widget.dart';
import 'package:flutter_task/views/screen/home/widgets/deals_widget.dart';
import 'package:flutter_task/views/screen/home/widgets/product_view.dart';
class ControllerScreen extends StatelessWidget {
  ControllerScreen({Key? key}) : super(key: key);
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  CartController cartController=Get.find<CartController>();

  MainController homeController=Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    cartController.getCartList();
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: homeController.buildScreens(),
        items: homeController.navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
      ),
    );
  }



}

class HomeScreen extends StatelessWidget {
   HomeScreen({
    Key? key,
  }) : super(key: key);
  CategoryController categoryController=Get.find();
  ProductController productController=Get.find<ProductController>();
  AddressController addressController=Get.find<AddressController>();
  DealsController dealsController=Get.find<DealsController>();
  @override
  Widget build(BuildContext context) {
    categoryController.getCategoryList();
    productController.getProductList();
    dealsController.getDealsList();
    return SafeArea(
      child: InfoWidget(
        builder: (context,deviceInfo) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child:
           deviceInfo.orientation==Orientation.landscape?
           buildLandScapeView(deviceInfo, context):buildPortraitView(deviceInfo, context),
          );
        }
      ),
    );
  }
   Column buildLandScapeView(DeviceInfo deviceInfo, BuildContext context)
   {
     return Column(
       children: [
         //AppBar
         AppBarView(),
         SizedBox(height: 20,),
         Expanded(child:CustomScrollView(
           slivers: [
             SliverToBoxAdapter(child:Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 //Search bar
                 Container(
                   decoration: BoxDecoration(
                       color: ColorResources.TEXT_BG,
                       borderRadius:BorderRadius.circular(15)
                   ),
                   child:TextField(
                     decoration: InputDecoration(
                       prefixIcon: Icon(Icons.search),
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(15)
                       ),
                       hintText: 'Search in thousands of product',
                     ),
                   ),
                 ),
                 SizedBox(height: 20,),
                 //Address
                 Row(
                   children: [
                     AddressView(addressModel: addressController.getHomeAddress,),
                     SizedBox(width: 10,),
                     AddressView(addressModel: addressController.getOfficeAddress,),

                   ],
                 ),
                 SizedBox(height: 10,),
                 //Categories Text,
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('Explore By Category ',style: TextStyle(fontWeight:FontWeight.normal,fontSize: deviceInfo.screenWidth/45),),
                     Text('See All (${categoryController.categoryList.length})',style:TextStyle(fontSize: deviceInfo.screenWidth/50,color: Theme.of(context).disabledColor)),
                   ],
                 ),
                 SizedBox(height: 10,),
                 //Categories List,
                 SizedBox(
                   height: deviceInfo.screenWidth/8,
                   width: deviceInfo.localWidth,
                   child:
                   Obx(()=>ListView.separated(
                     //shrinkWrap: true,
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (context,index){
                       return  SizedBox(
                           height: deviceInfo.screenWidth/9,
                           width:deviceInfo.localWidth/5.5 ,
                           child: CategoriesWidget(categoryModel: categoryController.categoryList[index],));
                     },
                     separatorBuilder: (context,index){
                       return SizedBox( width:deviceInfo.deviceType==DeviceType.Mobile? 15:50,);
                     },
                     itemCount: categoryController.categoryList.length,
                   ),
                   ),
                 ),
                 SizedBox(height: 10,),
                 //Categories Text,
                 Text('Deals Of The Day ',style: TextStyle(fontWeight:FontWeight.normal,fontSize: deviceInfo.screenWidth/45),),
                 SizedBox(height: 10,),
                 //Deals List,
                 SizedBox(
                   height: deviceInfo.screenWidth/7.2,
                   child: Obx(
                         ()=> ListView.separated(

                       //shrinkWrap: true,
                       scrollDirection: Axis.horizontal,
                       itemBuilder: (context,index){
                         return DealsView(dealsModel:dealsController.dealsList[index]);
                       },
                       separatorBuilder: (context,index){
                         return SizedBox(width: 10,);
                       },
                       itemCount: dealsController.dealsList.length,
                     ),
                   ),
                 ),
                 SizedBox(height: 20,),
                 //
               ],
             ) ,),
             SliverList(delegate:
             SliverChildBuilderDelegate(

                   (BuildContext context, int index) {

                 return  ProductView(productModel: productController.productList[index],index: index,);
               },childCount: productController.productList.length, ))
           ],
         ),
         ),

       ],
     );
   }


   Column buildPortraitView(DeviceInfo deviceInfo, BuildContext context) {
    return Column(
            children: [
              //AppBar
              AppBarView(),
              SizedBox(height: 20,),
              Expanded(child:CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Search bar
                      Container(
                        decoration: BoxDecoration(
                            color: ColorResources.TEXT_BG,
                            borderRadius:BorderRadius.circular(15)
                        ),
                        child:TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            hintText: 'Search in thousands of product',
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      //Address
                      Row(
                        children: [
                          AddressView(addressModel: addressController.getHomeAddress,),
                          SizedBox(width: 10,),
                          AddressView(addressModel: addressController.getOfficeAddress,),

                        ],
                      ),
                      SizedBox(height: 10,),
                      //Categories Text,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Explore By Category ',style: TextStyle(fontWeight:FontWeight.normal,fontSize: deviceInfo.screenHeight/55),),
                          Text('See All (${categoryController.categoryList.length})',style:TextStyle(fontSize: deviceInfo.screenHeight/65,color: Theme.of(context).disabledColor)),
                        ],
                      ),
                      SizedBox(height: 10,),
                      //Categories List,
                      SizedBox(
                        height: deviceInfo.screenHeight/8,
                        width: deviceInfo.localWidth,
                        child:
                        Obx(()=>ListView.separated(
                          //shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return  SizedBox(
                                height: deviceInfo.localHeight/8.1,
                                width:deviceInfo.localWidth/5.5 ,
                                child: CategoriesWidget(categoryModel: categoryController.categoryList[index],));
                          },
                          separatorBuilder: (context,index){
                            return SizedBox( width:deviceInfo.deviceType==DeviceType.Mobile? 15:50,);
                          },
                          itemCount: categoryController.categoryList.length,
                        ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      //Categories Text,
                      Text('Deals Of The Day ',style: TextStyle(fontWeight:FontWeight.normal,fontSize: deviceInfo.screenHeight/55),),
                      SizedBox(height: 10,),
                      //Deals List,
                      SizedBox(
                        height: deviceInfo.screenHeight/8.2,
                        child: Obx(
                              ()=> ListView.separated(

                            //shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return DealsView(dealsModel:dealsController.dealsList[index]);
                            },
                            separatorBuilder: (context,index){
                              return SizedBox(width: 10,);
                            },
                            itemCount: dealsController.dealsList.length,
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      //
                    ],
                  ) ,),
                  SliverList(delegate:
                  SliverChildBuilderDelegate(

                (BuildContext context, int index) {

                  return  ProductView(productModel: productController.productList[index],index: index,);
                },childCount: productController.productList.length, ))
                ],
              ),
              ),

            ],
          );
  }
}








