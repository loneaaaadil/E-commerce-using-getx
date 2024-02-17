import 'package:e_commerce_app/data/repository/recomemded_product_repo.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:get/get.dart';

class RecomemdedProductController extends GetxController {
//initialize the repo object
  final RecomemdedProductRepo recomemdedProductRepo;

  RecomemdedProductController({required this.recomemdedProductRepo});
//initialize the private empty list
  List<dynamic> _recomemdedProductList = [];
  //for publically access the list
  List<dynamic> get recomemdedProductList => _recomemdedProductList;

  bool _isloaded = false;
  bool get isloaded => _isloaded;

  Future<void> getRecomendedProductList() async {
    Response response = await recomemdedProductRepo.getRecomendedProductList();
    if (response.statusCode == 200) {
      // print('got recomended product');
      _recomemdedProductList = [];
      _recomemdedProductList
          .addAll(Product.fromJson(response.body).products as Iterable);
      _isloaded = true;
      update();
    } else {
      print('not recomended list');
    }
  }
}
