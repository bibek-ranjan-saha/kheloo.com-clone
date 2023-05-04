import 'dart:async';
import 'dart:math';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

import '../constants/asset_constants.dart';
import 'asset_image_view.dart';

class JackPotView extends StatelessWidget {
  const JackPotView({Key? key}) : super(key: key);

  static const Duration interval = Duration(seconds: 2);
  static Stream<int> stream = Stream<int>.periodic(interval, callback);

  static int callback(int value) {
    return (value + 1) * (Random().nextInt(8) + 1) + 1111111;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamBuilder<int>(
      stream: stream,
      builder: (context, snapshot) {
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const AssetImageView(
              fileName: AppAssetConstants.kJackPot,
            ),
            Container(
              padding: EdgeInsets.only(left: size.width * 0.124, top: 25),
              child: AnimatedFlipCounter(
                value:snapshot.data ?? 9999999,
                textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 10),
              ),
            )
          ],
        );
      },
    );
  }
}
