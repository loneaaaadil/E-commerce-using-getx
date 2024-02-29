import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/popular_product_controller.dart';
import 'package:e_commerce_app/controllers/recomemded_product_controller.dart';
import 'package:e_commerce_app/pages/food/popular_food_datails.dart';
import 'package:e_commerce_app/pages/food/recomended_food_details.dart';
import 'package:e_commerce_app/pages/home/main_food_page.dart';
import 'package:e_commerce_app/pages/splash/splash_screen.dart';
import 'package:e_commerce_app/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    print('height of screen ${MediaQuery.of(context).size.height}');
    return GetBuilder<PopularProductController>(
      builder: (_) => GetBuilder<RecomemdedProductController>(
        builder: (_) => GetMaterialApp(
          title: 'E-Commerence ',
          // home: const SplashScreen(),
          initialRoute: RouteHelper.getSplash(),
          getPages: RouteHelper.routes,
        ),
      ),
    );
  }
}
