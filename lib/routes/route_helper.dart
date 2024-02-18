// ignore_for_file: unnecessary_string_interpolations

import 'package:e_commerce_app/pages/cart/cart_page.dart';
import 'package:e_commerce_app/pages/food/popular_food_datails.dart';
import 'package:e_commerce_app/pages/food/recomended_food_details.dart';
import 'package:e_commerce_app/pages/home/home_page.dart';
import 'package:e_commerce_app/pages/home/main_food_page.dart';
import 'package:e_commerce_app/pages/splash/splash_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashScreen = '/splash-page';
  static const String intial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cartPage = '/cart-page';

  static String getSplash() => '$splashScreen';
  static String getInitial() => '$intial';

  //parameter page id=?pageId
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: intial, page: () => const HomePage()),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetails(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecomendedFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return const CartPage();
      },
      transition: Transition.fadeIn,
    )
  ];
}
