import 'package:flutter/material.dart';
import 'package:the_technology_maker/constants/asset_constants.dart';
import 'package:the_technology_maker/utils/double_utils.dart';

class CarouselIndicator extends StatefulWidget {
  final PageController controller;

  const CarouselIndicator({Key? key, required this.controller})
      : super(key: key);

  @override
  State<CarouselIndicator> createState() => _CarouselIndicatorState();
}

class _CarouselIndicatorState extends State<CarouselIndicator> {
  int currentIndex = 0;

  @override
  void didChangeDependencies() {
    widget.controller.addListener(() {
      setState(() {
        currentIndex = widget.controller.page?.toInt() ?? 0;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4,
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: AppAssetConstants.kBannerImages.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                widget.controller.animateToPage(
                  index,
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeIn,
                );
              },
              child: Container(
                width: 20,
                height: 4,
                color: currentIndex == index ? Colors.yellow : Colors.grey,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return 12.0.padding();
          },
        ),
      ),
    );
  }
}
