import "package:flutter/material.dart";

import "../../../../../../core/constants/values_manager.dart";

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(SizeManager.s0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeManager.sBorderRadius)),
      elevation: SizeManager.s0,
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(PaddingManager.p10),
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.inversePrimary)),
      ),
    );
  }
}
