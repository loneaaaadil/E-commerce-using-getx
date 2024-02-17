import 'package:e_commerce_app/data/api/api_client.dart';
import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:get/get.dart';

class RecomemdedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecomemdedProductRepo({required this.apiClient});

  Future<Response> getRecomendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMENDED_PRODUCT_URI);
  }
}
