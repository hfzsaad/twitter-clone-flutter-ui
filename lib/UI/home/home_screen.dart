import 'package:flutter/material.dart';
import 'package:twitter_clone/UI/feed/feed_screen.dart';
import 'package:twitter_clone/UI/search/SearchPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return FeedScreen(
          scaffoldKey: _scaffoldKey,
          refreshIndicatorKey: refreshIndicatorKey,
        );
      case 1:
        return SearchScreen(scaffoldKey: _scaffoldKey);
      case 2:
        return SearchScreen(scaffoldKey: _scaffoldKey);
      case 3:
        return SearchScreen(scaffoldKey: _scaffoldKey);
      default:
        return FeedScreen(scaffoldKey: _scaffoldKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // bottomNavigationBar: const BottomMenuBar(),
        // drawer: const SidebarMenu(),
        body: Container(
          child: _getPage(0),
        ),
      ),
    );
  }
}
