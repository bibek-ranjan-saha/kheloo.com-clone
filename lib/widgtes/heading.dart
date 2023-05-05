import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_technology_maker/utils/double_utils.dart';

import '../constants/color_constants.dart';

class HeadingView extends StatelessWidget {
  final String title;

  const HeadingView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Center(
          child: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.yellow.shade500, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(
              title,
              style:
                  GoogleFonts.oswald(fontWeight: FontWeight.w900, fontSize: 34),
            ),
          ),
        ),
        8.0.padding(),
        Center(
          child: Container(
            width: size.width * 0.5,
            height: 4,
            decoration: BoxDecoration(
              color: AppColorConstants.yellow,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
