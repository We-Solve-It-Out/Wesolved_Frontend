import 'dart:convert';

import 'package:get/get.dart';
import 'package:wesolve/features/shop/models/quote_model.dart';
import 'package:wesolve/features/shop/models/service_model.dart';
import 'package:wesolve/utils/popups/loaders.dart';
import '../../../../utils/http/http_client.dart';

class QuotesController extends GetxController {
  static QuotesController get instance => Get.find();

  final isLoading = false.obs;
  RxList<QuoteModel> featuredQuotes = <QuoteModel>[].obs;
  RxList<ServiceModel> featuredServices = <ServiceModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedData();
    super.onInit();
  }

  void fetchFeaturedData() async {
    try {
      isLoading.value = true;

      // Use THttpHelper to make the GET request to fetch quotes
      final quotesData = await THttpHelper.get('cotizaciones/proveedor/1');

      // Process the quotes
      final List<QuoteModel> quotes = quotesData.map<QuoteModel>((data) => QuoteModel.fromJson(data)).toList();
      featuredQuotes.assignAll(quotes);

      // Fetch and process service details
      await fetchServiceDetails();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchServiceDetails() async {
    try {
      // Fetch service details for each quote
      for (var quote in featuredQuotes) {
        final serviceId = quote.idServicio;
        final serviceData = await THttpHelper.get('servicios/proveedor/1/servicio/$serviceId');
        final service = ServiceModel.fromJson(serviceData);
        featuredServices.add(service);
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
