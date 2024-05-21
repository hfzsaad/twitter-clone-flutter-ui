import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/app_icons.dart';
import '../../common_widgets/bottomMenuBar/tabItem.dart';
import '../../utils/colors.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen(
      {Key? key, required this.scaffoldKey, this.refreshIndicatorKey})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  final GlobalKey<RefreshIndicatorState>? refreshIndicatorKey;

  Widget _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/CreateFeedPage/tweet');
      },
      child: customIcon(
        context,
        icon: AppIcon.fabTweet,
        isTwitterIcon: true,
        iconColor: Theme.of(context).colorScheme.onPrimary,
        size: 25,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/CreateFeedPage/tweet');
        },
        child: customIcon(
          context,
          icon: AppIcon.fabTweet,
          isTwitterIcon: true,
          iconColor: Theme.of(context).colorScheme.onPrimary,
          size: 25,
        ),
      ),
      backgroundColor: TwitterColor.mystic,
      body: SafeArea(
        child: SizedBox(
          child: RefreshIndicator(
            key: refreshIndicatorKey,
            onRefresh: () async {
              /// refresh home page feed
              // var feedState = Provider.of<FeedState>(context, listen: false);
              // feedState.getDataFromDatabase();
              // return Future.value(true);
            },
            child: _FeedPageBody(
              refreshIndicatorKey: refreshIndicatorKey,
              scaffoldKey: scaffoldKey,
            ),
          ),
        ),
      ),
    );
  }
}

class _FeedPageBody extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  final GlobalKey<RefreshIndicatorState>? refreshIndicatorKey;

  const _FeedPageBody(
      {Key? key, required this.scaffoldKey, this.refreshIndicatorKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, state, child) {
        return CustomScrollView(
          slivers: <Widget>[
            child!,
            SliverList(
              delegate: SliverChildListDelegate(
                [1, 2, 3].map(
                      (model) {
                    return Container(
                      color: Colors.white,
                      child: const Text("Tweet Data")
                    );
                  },
                ).toList(),
              ),
            )
          ],
        );
      },
      child: SliverAppBar(
        floating: true,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
            );
          },
        ),
        title: Image.asset('assets/images/twitter_icon.png', height: 40),
        centerTitle: true,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            color: Colors.grey.shade200,
            height: 1.0,
          ),
        ),
      ),
    );
  }
}
