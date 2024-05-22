import 'package:flutter/material.dart';
import 'package:twitter_clone/common_widgets/extention.dart';

import '../../models/feedModel.dart';
import '../../utils/enum.dart';
import '../cache_image.dart';

class TweetImage extends StatelessWidget {
  const TweetImage(
      {Key? key, required this.model, this.type, this.isRetweetImage = false})
      : super(key: key);

  final FeedModel model;
  final TweetType? type;
  final bool isRetweetImage;
  @override
  Widget build(BuildContext context) {
    if (model.imagePath != null) assert(type != null);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      alignment: Alignment.centerRight,
      child: model.imagePath == null
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(top: 8),
              child: InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(isRetweetImage ? 0 : 20),
                ),
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(isRetweetImage ? 0 : 20),
                  ),
                  child: Container(
                    width: context.width * (type == TweetType.Detail ? .95 : .8) -
                            8,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                    ),
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: CacheImage(
                        path: model.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
