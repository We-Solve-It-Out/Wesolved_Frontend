import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wesolve/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:wesolve/common/widgets/images/t_circular_image.dart';
import 'package:wesolve/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:wesolve/common/widgets/texts/t_product_price_text.dart';
import 'package:wesolve/common/widgets/texts/t_product_title_text.dart';
import 'package:wesolve/utils/constants/colors.dart';
import 'package:wesolve/utils/constants/enums.dart';
import 'package:wesolve/utils/constants/image_strings.dart';
import 'package:wesolve/utils/constants/sizes.dart';
import 'package:wesolve/utils/helpers/helper_functions.dart';
import '../../../controllers/product/product_controller.dart';
import '../../../models/product_model.dart';

class TQuoteMetaData extends StatelessWidget {
  const TQuoteMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    // Define constant prices (replace with actual values)
    const double originalPrice = 100.00; // Replace with your actual price
    const double salePrice = 80.00; // Replace with your actual sale price (optional)

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Price & Sale Price
        Row(
          children: [

            /// -- Sale Tag (if sale price exists)
            if (salePrice > 0.0)
              Row(
                children: [
                  TRoundedContainer(
                    backgroundColor: TColors.secondary,
                    radius: TSizes.sm,
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '${calculateSalePercentage(originalPrice, salePrice)}%',
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                ],
              ),

            /// Original Price (strikethrough if sale exists)
            if (salePrice > 0.0)
              Text(
                originalPrice.toStringAsFixed(2),
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall!
                    .apply(
                  decoration: TextDecoration.lineThrough,
                  color: darkMode ? TColors.white : TColors.black,
                ),
              ),

            /// Sale Price
            const TProductPriceText(
                price: salePrice > 0.0 ? '$salePrice' : '$originalPrice',
                isLarge: true),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        const TProductTitleText(title: 'Service Title'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const Text('Date: ', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500)),
            Text(
              DateFormat('dd/MM/yyyy').format(DateTime.now()),
              style: const TextStyle(fontSize: 14.0),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            const Text('Time: ', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500)),
            Text(
              DateFormat('HH:mm').format(DateTime.now()),
              style: const TextStyle(fontSize: 14.0),
            ),
          ],
        ),

        Row(
          children: [
            const TProductTitleText(title: 'Stock : ', smallSize: true),
            Text(
              'In Stock',
              // Replace with actual stock status from product data (if available)
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
      ],
    );
  }


  double calculateSalePercentage(double originalPrice, double salePrice) {
    if (originalPrice <= 0.0 || salePrice <= 0.0 ||
        salePrice >= originalPrice) {
      return 0.0; // Return 0% if original price is invalid, sale price is invalid, or not actually a discount
    }
    double discount = originalPrice - salePrice;
    double percentage = (discount / originalPrice) * 100;
    return percentage.roundToDouble(); // Round the percentage to avoid decimals
  }

}

