import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/data/repository/popular_product_repo.dart';
import 'package:e_commerce_app/model/CartModel.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cartController;

  bool _isloaded = false;
  bool get isloaded => _isloaded;

  int _quantity = 0;
  int _inCartItems = 0;

  int get quantity => _quantity;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      // print('got products');
      _popularProductList = [];
      _popularProductList
          .addAll(Product.fromJson(response.body).products as Iterable);
      // print(_popularProductList);
      _isloaded = true;
      update();
    } else {
      print('not getting');
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      // print('increment');
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
      // print('decreement');
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar('Item Count', "You can't reduce more!",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar('Item count', "you can't add more !",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cartController) {
    _quantity = 0;
    _inCartItems = 0;
    _cartController = cartController;
    var exist = false;
    exist = cartController.existInCart(product);
    print('exists or not ${exist.toString()}');
    if (exist) {
      _inCartItems = cartController.getQuantity(product);
    }
    print('the quantity in the cart is ${_inCartItems.toString()}');
  }

  void additem(ProductModel productModel) {
    //  print('item added');

    // if (_quantity > 0) {
    _cartController.addItems(productModel, _quantity);
    _quantity = 0;
    _inCartItems = _cartController.getQuantity(productModel);
    _cartController.items.forEach((key, value) {
      print(
          "the id is ${value.id.toString()} the quantity is ${value.quantity.toString()} ");
    });
    // } else {
    //   Get.snackbar('Item Count', 'You should add at least an item to the cart',
    //       backgroundColor: AppColors.mainColor, colorText: Colors.white);
    // }
    update();
  }

  int get totalItems {
    return _cartController.totalItems;
  }

  List<CartModel> get getItems {
    return _cartController.getItems;
  }
}
