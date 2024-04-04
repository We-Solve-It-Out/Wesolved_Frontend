import 'package:get/get.dart';
import 'package:wesolve/features/shop/screens/quotes/quotes.dart';
import 'package:wesolve/utils/constants/image_strings.dart';
import 'package:wesolve/utils/http/http_client.dart';
import 'package:wesolve/utils/popups/full_screen_loader.dart';
import 'package:wesolve/utils/popups/loaders.dart';

class AcceptQuoteController extends GetxController {
  static AcceptQuoteController get instance => Get.find();

  /// Update quote state to "aceptada"
  Future<void> acceptQuote(int cotizacionId) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Accepting the quote....', TImages.docerAnimation);

      // Update quote state to "aceptada"
      await updateQuoteState(cotizacionId, 'aceptada');

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Trigger UI update
      update();

      // Show success message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'The quote has been accepted.');
    } catch (e) {
      // Handle errors
      TFullScreenLoader.stopLoading();
      update();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Send request to update quote state
  Future<void> updateQuoteState(int cotizacionId, String newState) async {
    try {
      final response = await THttpHelper.put(
        'cotizaciones/estado/$cotizacionId',
        {'nuevoEstado': newState},
      );
    } catch (e) {
      // Handle exceptions
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}