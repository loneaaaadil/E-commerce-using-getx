import 'package:e_commerce_app/base/no_data.dart';
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/popular_product_controller.dart';
import 'package:e_commerce_app/controllers/recomemded_product_controller.dart';
import 'package:e_commerce_app/pages/food/popular_food_datails.dart';
import 'package:e_commerce_app/pages/home/food_page_body.dart';
import 'package:e_commerce_app/pages/home/main_food_page.dart';
import 'package:e_commerce_app/routes/route_helper.dart';
import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/widgets/app_icon.dart';
import 'package:e_commerce_app/widgets/big_text.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height30 * 2,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backGroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                Gap(Dimensions.width45 * 2),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backGroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backGroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                )
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (cartController) {
            return cartController.getItems.isNotEmpty
                ? Positioned(
                    top: Dimensions.height20 * 5,
                    right: Dimensions.width20,
                    left: Dimensions.width20,
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.only(top: Dimensions.height15),
                      // color: Colors.red,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GetBuilder<CartController>(
                            builder: (cartController) {
                          var cartList = cartController.getItems;
                          return ListView.builder(
                              itemCount: cartList.length,
                              itemBuilder: (_, index) {
                                return SizedBox(
                                  height: Dimensions.height100,
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          var popularindex = Get.find<
                                                  PopularProductController>()
                                              .popularProductList
                                              .indexOf(cartList[index].product);
                                          if (popularindex >= 0) {
                                            Get.toNamed(
                                                RouteHelper.getPopularFood(
                                                    popularindex, "cartpage"));
                                          } else {
                                            var recommendedIndex = Get.find<
                                                    RecomemdedProductController>()
                                                .recomemdedProductList
                                                .indexOf(
                                                    cartList[index].product);

                                            if (recommendedIndex < 0) {
                                              Get.snackbar("History Product",
                                                  "Product review is not available for history products",
                                                  backgroundColor:
                                                      AppColors.mainColor,
                                                  colorText: Colors.white);
                                            } else {
                                              Get.toNamed(RouteHelper
                                                  .getRecommendedFood(
                                                      recommendedIndex,
                                                      "cartpage"));
                                            }
                                          }
                                        },
                                        child: Container(
                                          height: Dimensions.height100,
                                          width: Dimensions.width20 * 5,
                                          margin: EdgeInsets.only(
                                              bottom: Dimensions.height20),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    AppConstants.BASE_URL +
                                                        AppConstants.UPLOADS +
                                                        cartController
                                                            .getItems[index]
                                                            .img!),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              color: Colors.white),
                                        ),
                                      ),
                                      Gap(Dimensions.width10),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          BigText(
                                            text: cartController
                                                .getItems[index].name!,
                                            color: Colors.black54,
                                          ),
                                          Smalltext(
                                              text: cartController
                                                  .getItems[index].name!),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigText(
                                                text:
                                                    '\$ ${cartController.getItems[index].price}',
                                                color: Colors.redAccent,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: Dimensions.width10,
                                                    right: Dimensions.width10,
                                                    top: Dimensions.height10,
                                                    bottom:
                                                        Dimensions.height10),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    Dimensions.radius20,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        cartController.addItems(
                                                            cartList[index]
                                                                .product!,
                                                            -1);
                                                        // productController
                                                        //     .setQuantity(false);
                                                      },
                                                      child: Icon(
                                                        Icons.remove,
                                                        color:
                                                            AppColors.signColor,
                                                      ),
                                                    ),
                                                    Gap(Dimensions.width10 / 2),
                                                    BigText(
                                                      text: cartList[index]
                                                          .quantity
                                                          .toString(),
                                                      // productController.inCartItems
                                                      //     .toString(),
                                                      size: 19,
                                                    ),
                                                    Gap(Dimensions.width10 / 2),
                                                    GestureDetector(
                                                      onTap: () {
                                                        // productController
                                                        //     .setQuantity(true);
                                                        cartController.addItems(
                                                            cartList[index]
                                                                .product!,
                                                            1);
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                        color:
                                                            AppColors.signColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ))
                                    ],
                                  ),
                                );
                              });
                        }),
                      ),
                    ),
                  )
                : const NoDataPage(text: "Your cart is empty");
          }),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
        return Container(
          height: Dimensions.height120,
          padding: EdgeInsets.only(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height30,
              bottom: Dimensions.height30),
          decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2)),
          ),
          child: cartController.getItems.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          top: Dimensions.height20,
                          bottom: Dimensions.height20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius20,
                        ),
                      ),
                      child: Row(
                        children: [
                          Gap(Dimensions.width10 / 2),
                          BigText(
                            text: "\$ ${cartController.totalAmount}",
                            size: 19,
                          ),
                          Gap(Dimensions.width10 / 2),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        top: Dimensions.height20,
                        bottom: Dimensions.height20 - 1,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // productController.additem(product);
                          cartController.addToHistory();
                        },
                        child: BigText(
                          text: "Check out",
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              : Container(),
        );
      }),
    );
  }
}
