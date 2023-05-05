import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import 'package:the_technology_maker/constants/asset_constants.dart';
import 'package:the_technology_maker/constants/color_constants.dart';
import 'package:the_technology_maker/constants/string_constants.dart';
import 'package:the_technology_maker/utils/double_utils.dart';
import 'package:the_technology_maker/utils/utils.dart';
import 'package:the_technology_maker/widgtes/heading.dart';

import '../widgtes/app_bar.dart';
import '../widgtes/asset_image_view.dart';
import '../widgtes/bottom_bar.dart';
import '../widgtes/carousel_indicator.dart';
import '../widgtes/games_category_view.dart';
import '../widgtes/jackpot_view.dart';
import '../widgtes/users_section.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _carouselController = PageController();
    _videoController = PodPlayerController(
      playVideoFrom: PlayVideoFrom.vimeo(AppAssetConstants.kVimeoId),
    )..initialise();
    super.initState();
  }

  late final PageController _carouselController;
  late final PodPlayerController _videoController;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            const [CommonAppBar()],
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 60),
          children: [
            AspectRatio(
              aspectRatio: 1.6,
              child: PageView.builder(
                controller: _carouselController,
                itemCount: AppAssetConstants.kBannerImages.length,
                itemBuilder: (context, index) {
                  return AppImageView(
                    fileName: AppAssetConstants.kBannerImages[index],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: CarouselIndicator(
                controller: _carouselController,
              ),
            ),
            Container(
              height: 4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.white, Colors.yellow],
                ),
              ),
            ),
            Container(
              height: 56,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purple, Colors.deepPurple],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...AppStringConstants.kLanguages
                      .map(
                        (e) => Text(
                          e,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColorConstants.orange),
                        ),
                      )
                      .toList(),
                  InkWell(
                    child: Text(
                      "...",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColorConstants.orange),
                    ),
                    onTap: () {
                      showSnackBar(
                          context: context,
                          text: "Whole language popup should open");
                    },
                  )
                ],
              ),
            ),
            Container(
              height: 4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.white, Colors.yellow],
                ),
              ),
            ),
            14.0.padding(),
            const JackPotView(),
            14.0.padding(),
            const HeadingView(title: AppStringConstants.kLiveUpdate),
            14.0.padding(),
            const UsersSection(),
            14.0.padding(),
            PodVideoPlayer(
              controller: _videoController,
              backgroundColor: AppColorConstants.purple,
              podProgressBarConfig: PodProgressBarConfig(
                playingBarColor: AppColorConstants.orange,
              ),
            ),
            14.0.padding(),
            const HeadingView(title: AppStringConstants.kGames),
            14.0.padding(),
            ...AppStringConstants.kGameSectionsList.map(
                (e) => GamesCategory(title: e, count: Random().nextInt(30))),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton.small(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {
          showSnackBar(
              context: context,
              text: "Floating action button has been pressed");
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const CommonBottomBar(),
    );
  }

  @override
  void dispose() {
    _carouselController.dispose();
    _videoController.dispose();
    super.dispose();
  }
}
