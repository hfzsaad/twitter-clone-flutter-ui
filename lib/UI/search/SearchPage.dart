import 'package:flutter/material.dart';

import '../../common_widgets/BottomMenuBar/tabItem.dart';
import '../../common_widgets/app_icons.dart';
import '../../common_widgets/custom_app_bar.dart';
import '../../utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  void onSettingIconPressed() {
    Navigator.pushNamed(context, '/TrendsPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        scaffoldKey: widget.scaffoldKey,
        icon: AppIcon.settings,
        onActionPressed: onSettingIconPressed,
        onSearchChanged: (text) {
          // state.filterByUsername(text);
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // state.getDataFromDatabase();
          return Future.value();
        },
        child: ListView.separated(
          addAutomaticKeepAlives: false,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => const _UserTile(),
          separatorBuilder: (_, index) => const Divider(
            height: 0,
          ),
          itemCount: 3,
        ),
      ),
    );
  }
}

class _UserTile extends StatelessWidget {
  const _UserTile({Key? key}) : super(key: key);
  // final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // Navigator.push(context, ProfilePage.getRoute(profileId: user.userId!));
      },
      // leading: CircularImage(path: user.profilePic, height: 40),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Flexible(
              child: Text(
            "user.displayName!",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                overflow: TextOverflow.ellipsis),
          )),
          const SizedBox(width: 3),
          // user.isVerified!
          //     ?
          customIcon(
                  context,
                  icon: AppIcon.blueTick,
                  isTwitterIcon: true,
                  iconColor: AppColor.primary,
                  size: 13,
                  paddingIcon: 3,
                )
              // : const SizedBox(width: 0),
        ],
      ),
      subtitle: const Text("user.userName!"),
    );
  }
}
