import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImageView extends StatelessWidget {
  const AppImageView({
    Key? key,
    required this.fileName,
    this.height,
    this.width,
    this.color,
    this.scale,
    this.fit,
  }) : super(key: key);

  final String fileName;
  final double? height;
  final double? width;
  final Color? color;
  final double? scale;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return _getView();
  }

  Widget _getView() {
    bool isNetwork = fileName.startsWith("http");
    String mimeType = fileName.split(".").last;

    if(isNetwork)
      {
        return CachedNetworkImage(
          imageUrl: fileName,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider, fit: fit ?? BoxFit.cover),
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
      }
    if (mimeType.isEmpty) {
      return Icon(
        Icons.image_not_supported_outlined,
        size: width,
        color: color,
      );
    }

    switch (mimeType) {
      case "svg":
        return SvgPicture.asset(
          fileName,
          height: height,
          width: width,
          color: color,
          fit: fit ?? BoxFit.scaleDown,
        );
      case "png":
      case "jpg":
      case "jpeg":
      case "webp":
        return Image.asset(
          fileName,
          height: height,
          width: width,
          scale: scale,
          fit: fit ?? BoxFit.scaleDown,
        );
      default:
        return Icon(
          Icons.image_not_supported_outlined,
          size: width,
          color: color,
        );
    }
  }
}
