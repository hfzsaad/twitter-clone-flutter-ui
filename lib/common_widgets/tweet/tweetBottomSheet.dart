import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/common_widgets/extention.dart';

import '../../models/feedModel.dart';
import '../../state/authState.dart';
import '../../utils/colors.dart';
import '../../utils/enum.dart';
import '../../utils/utility.dart';
import '../BottomMenuBar/tabItem.dart';
import '../app_icons.dart';

class TweetBottomSheet {
  Widget tweetOptionIcon(BuildContext context,
      {required FeedModel model,
      required TweetType type,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return Container(
      width: 25,
      height: 25,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: customIcon(context,
          icon: AppIcon.arrowDown,
          isTwitterIcon: true,
          iconColor: AppColor.lightGrey),
    ).ripple(
      () {
        _openBottomSheet(context,
            type: type, model: model, scaffoldKey: scaffoldKey);
      },
      borderRadius: BorderRadius.circular(20),
    );
  }

  void _openBottomSheet(BuildContext context,
      {required TweetType type,
      required FeedModel model,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    var authState = Provider.of<AuthState>(context, listen: false);
    bool isMyTweet = authState.userId == model.userId;
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
            padding: const EdgeInsets.only(top: 5, bottom: 0),
            height: context.height *
                (type == TweetType.Tweet
                    ? (isMyTweet ? .25 : .44)
                    : (isMyTweet ? .38 : .52)),
            width: context.width,
            decoration: BoxDecoration(
              color: Theme.of(context).bottomSheetTheme.backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: type == TweetType.Tweet
                ? _tweetOptions(context,
                    scaffoldKey: scaffoldKey,
                    isMyTweet: isMyTweet,
                    model: model,
                    type: type)
                : _tweetDetailOptions(context,
                    scaffoldKey: scaffoldKey,
                    isMyTweet: isMyTweet,
                    model: model,
                    type: type));
      },
    );
  }

  Widget _tweetDetailOptions(BuildContext context,
      {required bool isMyTweet,
      required FeedModel model,
      required TweetType type,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return Column(
      children: <Widget>[
        Container(
          width: context.width * .1,
          height: 5,
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        isMyTweet
            ? _widgetBottomSheetRow(
                context,
                AppIcon.delete,
                text: 'Delete Tweet',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Delete"),
                      content: const Text('Do you want to delete this Tweet?'),
                      actions: [
                        // ignore: deprecated_member_use
                        TextButton(
                          // textColor: Colors.black,
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        // ignore: deprecated_member_use
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              TwitterColor.dodgeBlue,
                            ),
                            foregroundColor: MaterialStateProperty.all(
                              TwitterColor.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Confirm'),
                        ),
                      ],
                    ),
                  );
                },
                isEnable: true,
              )
            : Container(),
        isMyTweet
            ? _widgetBottomSheetRow(
                context,
                AppIcon.unFollow,
                text: 'Pin to profile',
              )
            : _widgetBottomSheetRow(
                context,
                AppIcon.unFollow,
                text: 'Unfollow ${model.user!.userName}',
              ),
        isMyTweet
            ? Container()
            : _widgetBottomSheetRow(
                context,
                AppIcon.mute,
                text: 'Mute ${model.user!.userName}',
              ),
        _widgetBottomSheetRow(
          context,
          AppIcon.mute,
          text: 'Mute this conversation',
        ),
        _widgetBottomSheetRow(
          context,
          AppIcon.viewHidden,
          text: 'View hidden replies',
        ),
        isMyTweet
            ? Container()
            : _widgetBottomSheetRow(
                context,
                AppIcon.block,
                text: 'Block ${model.user!.userName}',
              ),
        isMyTweet
            ? Container()
            : _widgetBottomSheetRow(
                context,
                AppIcon.report,
                text: 'Report Tweet',
              ),
      ],
    );
  }

  Widget _tweetOptions(BuildContext context,
      {required bool isMyTweet,
      required FeedModel model,
      required TweetType type,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return Column(
      children: <Widget>[
        Container(
          width: context.width * .1,
          height: 5,
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        isMyTweet
            ? _widgetBottomSheetRow(
                context,
                AppIcon.delete,
                text: 'Delete Tweet',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Delete"),
                      content: const Text('Do you want to delete this Tweet?'),
                      actions: [
                        // ignore: deprecated_member_use
                        TextButton(
                          // textColor: Colors.black,
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        // ignore: deprecated_member_use
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              TwitterColor.dodgeBlue,
                            ),
                            foregroundColor: MaterialStateProperty.all(
                              TwitterColor.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Confirm'),
                        ),
                      ],
                    ),
                  );
                },
                isEnable: true,
              )
            : Container(),
        isMyTweet
            ? _widgetBottomSheetRow(
                context,
                AppIcon.thumbpinFill,
                text: 'Pin to profile',
              )
            : _widgetBottomSheetRow(
                context,
                AppIcon.sadFace,
                text: 'Not interested in this',
              ),
        isMyTweet
            ? Container()
            : _widgetBottomSheetRow(
                context,
                AppIcon.unFollow,
                text: 'Unfollow ${model.user!.userName}',
              ),
        isMyTweet
            ? Container()
            : _widgetBottomSheetRow(
                context,
                AppIcon.mute,
                text: 'Mute ${model.user!.userName}',
              ),
        isMyTweet
            ? Container()
            : _widgetBottomSheetRow(
                context,
                AppIcon.block,
                text: 'Block ${model.user!.userName}',
              ),
        isMyTweet
            ? Container()
            : _widgetBottomSheetRow(
                context,
                AppIcon.report,
                text: 'Report Tweet',
              ),
      ],
    );
  }

  Widget _widgetBottomSheetRow(BuildContext context, IconData icon,
      {required String text, Function? onPressed, bool isEnable = false}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: <Widget>[
            customIcon(
              context,
              icon: icon,
              isTwitterIcon: true,
              size: 25,
              paddingIcon: 8,
              iconColor:
                  onPressed != null ? AppColor.darkGrey : AppColor.lightGrey,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              text,
              style: TextStyle(
                color: isEnable ? AppColor.secondary : AppColor.lightGrey,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ).ripple(() {
        if (onPressed != null) {
          onPressed();
        } else {
          Navigator.pop(context);
        }
      }),
    );
  }

}
