import 'package:get/get.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:wesolve/features/shop/controllers/categories_controller.dart';
import 'package:wesolve/features/shop/controllers/product/banner_controller.dart';
import '../../../data/repositories/banners/banner_repository.dart';
import '../../../data/repositories/brands/brand_repository.dart';
import '../../../data/repositories/categories/category_repository.dart';
import '../../../data/repositories/product/product_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../../shop/controllers/dummy_data.dart';
import '../../shop/controllers/product/product_controller.dart';

class UploadDataController extends GetxController {
  static UploadDataController get instance => Get.find();

  Future<void> uploadCategories() async {
    try {
      // The following line will enable the Android and iOS wakelock.
      WakelockPlus.enable();

      TFullScreenLoader.openLoadingDialog('Sit Tight! Your CATEGORIES are uploading...', TImages.cloudUploadingAnimation);

      final controller = Get.put(CategoryRepository());

      // Upload All Categories and replace the Parent IDs in Firebase Console
      await controller.uploadDummyData(TDummyData.categories);

      // Re-fetch latest Categories
      await CategoryController.instance.fetchCategories();

      TLoaders.successSnackBar(title: 'Congratulations', message: 'All Categories Uploaded Successfully.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // The next line disables the wakelock again.
      WakelockPlus.disable();
      TFullScreenLoader.stopLoading();
    }
  }

  Future<void> uploadProductCategories() async {
    try {
      // The following line will enable the Android and iOS wakelock.
      WakelockPlus.enable();

      TFullScreenLoader.openLoadingDialog(
        'Sit Tight! Your PRODUCT CATEGORIES relationship is uploading...',
        TImages.cloudUploadingAnimation,
      );

      final controller = Get.put(CategoryRepository());

      // Upload All Categories and replace the Parent IDs in Firebase Console
      await controller.uploadProductCategoryDummyData(TDummyData.productCategories);

      TLoaders.successSnackBar(title: 'Congratulations', message: 'All Categories Uploaded Successfully.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // The next line disables the wakelock again.
      WakelockPlus.disable();
      TFullScreenLoader.stopLoading();
    }
  }

  Future<void> uploadProducts() async {
    try {
      // The following line will enable the Android and iOS wakelock.
      WakelockPlus.enable();

      TFullScreenLoader.openLoadingDialog(
        'Sit Tight! Your Products are uploading. It may take a while...',
        TImages.cloudUploadingAnimation,
      );

      final controller = Get.put(ProductRepository());

      // Upload All Products and replace the Parent IDs in Firebase Console
      await controller.uploadDummyData(TDummyData.products);

      // Re-fetch latest Featured Products
      ProductController.instance.fetchFeaturedProducts();

      TLoaders.successSnackBar(title: 'Congratulations', message: 'All Products Uploaded Successfully.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // The next line disables the wakelock again.
      WakelockPlus.disable();
      TFullScreenLoader.stopLoading();
    }
  }

  Future<void> uploadBanners() async {
    try {
      // The following line will enable the Android and iOS wakelock.
      WakelockPlus.enable();

      TFullScreenLoader.openLoadingDialog('Sit Tight! Your Banners are uploading. It may take a while...', TImages.cloudUploadingAnimation);

      final controller = Get.put(BannerRepository());

      // Upload All Products and replace the Parent IDs in Firebase Console
      await controller.uploadBannersDummyData(TDummyData.banners);

      // Re-fetch latest Banners
      final bannerController = Get.put(BannerController());
      await bannerController.fetchBanners();

      TLoaders.successSnackBar(title: 'Congratulations', message: 'All Products Uploaded Successfully.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // The next line disables the wakelock again.
      WakelockPlus.disable();
      TFullScreenLoader.stopLoading();
    }
  }
}
