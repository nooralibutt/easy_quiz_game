import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imgPath;
  final BoxFit fit;
  final double? width;
  final double? height;
  const ImageWidget(
      {Key? key,
      required this.imgPath,
      required this.fit,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imgPath.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: imgPath,
        placeholder: (_, __) => const Placeholder(),
        errorWidget: (_, __, ___) => const Placeholder(),
        fit: fit,
        width: width,
        height: height,
      );
    }

    return Image(
      image: AssetImage(imgPath),
      fit: BoxFit.cover,
      // width: double.infinity,
      // height: double.infinity,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;

        return const Placeholder();
      },
    );
  }
}
