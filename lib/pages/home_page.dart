import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import 'package:the_technology_maker/constants/asset_constants.dart';
import 'package:the_technology_maker/constants/color_constants.dart';
import 'package:the_technology_maker/constants/string_constants.dart';
import 'package:the_technology_maker/utils/double_utils.dart';

import '../widgtes/app_bar.dart';
import '../widgtes/bottom_bar.dart';
import '../widgtes/carousel_indicator.dart';
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
                  return CachedNetworkImage(
                    imageUrl: AppAssetConstants.kBannerImages[index],
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) => Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.image_not_supported_rounded),
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
                        (e) => Text(e),
                      )
                      .toList(),
                  InkWell(
                    child: const Text("..."),
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
            Center(
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => LinearGradient(
                  colors: [AppColorConstants.yellow, Colors.white38],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: Text(
                  "LIVE WITHDRAWAL",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ),
            ),
            8.0.padding(),
            Center(
              child: Container(
                width: size.width * 0.65,
                height: 4,
                color: AppColorConstants.yellow,
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
