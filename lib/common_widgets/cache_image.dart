import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({
    Key? key,
    this.path,
    this.fit = BoxFit.contain,
    this.errorWidget,
  }) : super(key: key);
  final String? path;
  final BoxFit fit;
  final Widget? errorWidget;

  Widget customNetworkImage(String? path, {BoxFit fit = BoxFit.contain}) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: path ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6TaCLCqU4K0ieF27ayjl51NmitWaJAh_X0r1rLX4gMvOe0MDaYw&s",
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholderFadeInDuration: const Duration(milliseconds: 500),
      placeholder: (context, url) => Container(
        color: const Color(0xffeeeeee),
      ),
      cacheKey: path,
      errorWidget: (context, url, error) =>
      errorWidget ??
          Container(
            color: const Color(0xffeeeeee),
            child: Icon(
              Icons.error,
              color: Colors.grey[700],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return customNetworkImage(path, fit: fit);
  }
}
