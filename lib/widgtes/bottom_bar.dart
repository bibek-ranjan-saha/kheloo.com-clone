import 'package:flutter/material.dart';

import '../constants/asset_constants.dart';
import '../constants/string_constants.dart';
import 'asset_image_view.dart';

class CommonBottomBar extends StatelessWidget {
  const CommonBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BottomAppBar(
      height: kToolbarHeight + 20,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: Stack(
              children: [
                Transform(
                  alignment: FractionalOffset.bottomLeft,
                  transform: Matrix4.skewX(0.6),
                  child: Container(
                    color: Colors.yellow,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppImageView(
                        fileName: AppAssetConstants.kBottomNavIcons[0],
                        fit: BoxFit.cover,
                        height: 36,
                      ),
                      Text(
                        AppStringConstants.kBottomNavText[1],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(right: size.width * 0.1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppImageView(
                    fileName: AppAssetConstants.kBottomNavIcons[1],
                    fit: BoxFit.cover,
                    height: 46,
                  ),
                  Text(
                    AppStringConstants.kBottomNavText[1],
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(left: size.width * 0.1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppImageView(
                    fileName: AppAssetConstants.kBottomNavIcons[2],
                    fit: BoxFit.cover,
                    height: 46,
                  ),
                  Text(
                    AppStringConstants.kBottomNavText[2],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white, overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Stack(
              children: [
                Transform(
                  alignment: FractionalOffset.bottomLeft,
                  transform: Matrix4.skewX(-0.6),
                  child: Container(
                    color: Colors.yellow,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left : size.width * 0.1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppImageView(
                          fileName: AppAssetConstants.kBottomNavIcons[3],
                          fit: BoxFit.cover,
                          height: 36,
                        ),
                        Text(
                          AppStringConstants.kBottomNavText[3],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
