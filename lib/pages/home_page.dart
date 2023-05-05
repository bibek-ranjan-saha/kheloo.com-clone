import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import 'package:the_technology_maker/constants/asset_constants.dart';
import 'package:the_technology_maker/constants/color_constants.dart';
import 'package:the_technology_maker/constants/string_constants.dart';
import 'package:the_technology_maker/utils/double_utils.dart';
import 'package:the_technology_maker/widgtes/heading.dart';

import '../widgtes/app_bar.dart';
import '../widgtes/asset_image_view.dart';
import '../widgtes/bottom_bar.dart';
import '../widgtes/carousel_indicator.dart';
import '../widgtes/games_category_view.dart';
import '../widgtes/jackpot_view.dart';

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
                    onTap: () {},
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: size.longestSide * 0.25,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.yellow, Colors.white, Colors.yellow],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.deepPurple,
                          Colors.purple,
                          Colors.deepPurple
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      runAlignment: WrapAlignment.spaceEvenly,
                      children: AppStringConstants.kUsersList
                          .map(
                            (e) => SizedBox(
                              width: (size.width * 0.5) - 30,
                              child: ListTile(
                                contentPadding: const EdgeInsets.only(
                                  left: 0.0,
                                  right: 0.0,
                                ),
                                leading: Container(
                                  height: 52,
                                  width: 52,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.orange, width: 2.5),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: const Icon(
                                    Icons.people_alt,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                horizontalTitleGap: 4,
                                title: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: e,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: " ₹ ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.orange),
                                      ),
                                      TextSpan(
                                        text: "${Random().nextInt(50000)}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                subtitle: Text(
                                  "${Random().nextInt(55)} "
                                  "second ago",
                                  style: const TextStyle(
                                    color: Colors.white38,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
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
            const GamesCategory(title: 'Popular games',count: 7),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton.small(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {},
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
