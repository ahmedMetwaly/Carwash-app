import 'package:flutter/material.dart';
import '../../../../../../../core/constants/values_manager.dart';


class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton(
      {super.key, required this.onPressed, required this.imagePath});
  final Function onPressed;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: PaddingManager.pSocialBtnVPadding,
            horizontal: PaddingManager.pSocialBtnHPadding),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(SizeManager.sBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onPrimary,
              blurRadius: SizeManager.sBlurRadius,
              offset: SizeManager.socialBtnShadowOffset,
            )
          ],
        ),
        child: Image.asset(
          imagePath,
          width: SizeManager.sIconSize,
          height: SizeManager.sIconSize,
        ),
      ),
    );
  }
}
