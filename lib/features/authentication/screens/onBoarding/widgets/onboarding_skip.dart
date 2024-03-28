import 'package:flutter/material.dart';
import 'package:wesolve/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:wesolve/utils/constants/sizes.dart';
import 'package:wesolve/utils/constants/text_strings.dart';
import 'package:wesolve/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text(TTexts.skip),
        ));
  }
}