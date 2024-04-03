import 'dart:convert';

import 'package:get/get.dart';
import 'package:wesolve/utils/popups/loaders.dart';
import '../../models/service_model.dart';
import '../../../../utils/http/http_client.dart';

class ServiceController extends GetxController {
  static ServiceController get instance => Get.find();

  final isLoading = false.obs;
  RxList<ServiceModel> featuredProducts = <ServiceModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      // Use THttpHelper to make the GET request
      final responseData = await THttpHelper.get('servicios/proveedor/1');

      // Process the response data
      final List<dynamic> productsData = responseData;
      final List<ServiceModel> products =
      productsData.map((data) => ServiceModel.fromJson(data)).toList();
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
