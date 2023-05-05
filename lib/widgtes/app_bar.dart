import 'package:flutter/material.dart';
import 'package:the_technology_maker/utils/double_utils.dart';

import '../constants/asset_constants.dart';
import '../constants/color_constants.dart';
import '../utils/utils.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      toolbarHeight: kToolbarHeight,
      title: Image.asset(
        AppAssetConstants.kLogo,
        fit: BoxFit.contain,
        height: kToolbarHeight,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            showSnackBar(
                context: context,
                text: "Promotion has been clicked");
          },
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  AppAssetConstants.kPromotionIcon,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                "Promotions",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.yellow),
              ),
            ],
          ),
        ),
        12.0.padding(),
        TextButton(
          onPressed: () {
            showSnackBar(
                context: context,
                text: "Login has been clicked");
          },
          style: TextButton.styleFrom(
            backgroundColor: AppColorConstants.orange,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            minimumSize: const Size(kToolbarHeight, kToolbarHeight),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Login",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
