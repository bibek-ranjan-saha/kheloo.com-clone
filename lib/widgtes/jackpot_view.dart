import 'dart:async';
import 'dart:math';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

import '../constants/asset_constants.dart';
import 'asset_image_view.dart';

class JackPotView extends StatefulWidget {
  const JackPotView({Key? key}) : super(key: key);

  @override
  State<JackPotView> createState() => _JackPotViewState();
}

class _JackPotViewState extends State<JackPotView> {
  Duration interval = const Duration(seconds: 2);

  int callback(int value) {
    if (value >= 9999999) {
      return value - Random().nextInt(8);
    }
    return value + Random().nextInt(8);
  }

  int jackPotValue = 1111111;

  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(interval, (timer) {
      setState(() {
        jackPotValue = callback(jackPotValue);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        const AppImageView(
          fileName: AppAssetConstants.kJackPot,
        ),
        Container(
          padding: EdgeInsets.only(left: size.width * 0.15, top: 25),
          child: AnimatedFlipCounter(
            value: jackPotValue,
            textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Colors.red,
                fontWeight: FontWeight.w800,
                letterSpacing: size.width * 0.035),
          ),
        )
      ],
    );
  }
}
