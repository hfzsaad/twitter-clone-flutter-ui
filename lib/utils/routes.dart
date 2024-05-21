import 'package:flutter/material.dart';
import 'package:twitter_clone/UI/authentication/sign_in_screen.dart';
import 'package:twitter_clone/UI/authentication/sign_up_screen.dart';
import 'package:twitter_clone/UI/authentication/verify_email_screen.dart';
import 'package:twitter_clone/UI/search/SearchPage.dart';

import '../UI/authentication/forgot_password_screen.dart';
import '../UI/authentication/welcome_screen.dart';
import 'customeRoute.dart';

class Routes {
  static dynamic route() {
    return {
      'WelcomePage': (BuildContext context) => const WelcomeScreen(),
    };
  }

  static void sendNavigationEventToFirebase(String? path) {
    if (path != null && path.isNotEmpty) {
      // analytics.setCurrentScreen(screenName: path);
    }
  }

  static Route? onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name!.split('/');
    if (pathElements[0] != '' || pathElements.length == 1) {
      return null;
    }
    switch (pathElements[1]) {
      // case "ComposeTweetPage":
      //   bool isRetweet = false;
      //   bool isTweet = false;
      //   if (pathElements.length == 3 && pathElements[2].contains('retweet')) {
      //     isRetweet = true;
      //   } else if (pathElements.length == 3 &&
      //       pathElements[2].contains('tweet')) {
      //     isTweet = true;
      //   }
      //   return CustomRoute<bool>(
      //       builder: (BuildContext context) =>
      //           ChangeNotifierProvider<ComposeTweetState>(
      //             create: (_) => ComposeTweetState(),
      //             child:
      //             ComposeTweetPage(isRetweet: isRetweet, isTweet: isTweet),
      //           ));
      // case "FeedPostDetail":
      //   var postId = pathElements[2];
      //   return SlideLeftRoute<bool>(
      //       builder: (BuildContext context) => FeedPostDetail(
      //         postId: postId,
      //       ),
      //       settings: const RouteSettings(name: 'FeedPostDetail'));
      // case "ProfilePage":
      //   String profileId;
      //   if (pathElements.length > 2) {
      //     profileId = pathElements[2];
      //     return CustomRoute<bool>(
      //         builder: (BuildContext context) => ProfilePage(
      //           profileId: profileId,
      //         ));
      //   }
      //   return CustomRoute(builder: (BuildContext context) => const HomePage());
      //
      // case "CreateFeedPage":
      //   return CustomRoute<bool>(
      //       builder: (BuildContext context) =>
      //           ChangeNotifierProvider<ComposeTweetState>(
      //             create: (_) => ComposeTweetState(),
      //             child:
      //             const ComposeTweetPage(isRetweet: false, isTweet: true),
      //           ));
      case "WelcomePage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => const WelcomeScreen());
      case "SignIn":
        return CustomRoute<bool>(
            builder: (BuildContext context) => const SignInScreen());
      case "SignUp":
        return CustomRoute<bool>(
            builder: (BuildContext context) => const SignUpScreen());
      case "ForgetPasswordPage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => const ForgetPasswordScreen());
      case "VerifyEmailPage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => const VerifyEmailScreen());
      case "SearchPage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => const SearchScreen());
      // case "ImageViewPge":
      //   return CustomRoute<bool>(
      //       builder: (BuildContext context) => const ImageViewPge());
      // case "ChatScreenPage":
      //   return CustomRoute<bool>(
      //       builder: (BuildContext context) => const ChatScreenPage());
      // case "NewMessagePage":
      //   return CustomRoute<bool>(
      //     builder: (BuildContext context) => NewMessagePage(),
      //   );
      // case "SettingsAndPrivacyPage":
      //   return CustomRoute<bool>(
      //     builder: (BuildContext context) => const SettingsAndPrivacyPage(),
      //   );
      // case "AccountSettingsPage":
      //   return CustomRoute<bool>(
      //     builder: (BuildContext context) => const AccountSettingsPage(),
      //   );
      // case "PrivacyAndSaftyPage":
      //   return CustomRoute<bool>(
      //     builder: (BuildContext context) => const PrivacyAndSaftyPage(),
      //   );
      // case "NotificationPage":
      //   return CustomRoute<bool>(
      //     builder: (BuildContext context) => const NotificationPage(),
      //   );
      // case "ContentPrefrencePage":
      //   return CustomRoute<bool>(
      //     builder: (BuildContext context) => const ContentPrefrencePage(),
      //   );
      // case "DisplayAndSoundPage":
      //   return CustomRoute<bool>(
      //     builder: (BuildContext context) => const DisplayAndSoundPage(),
      //   );
      // case "DirectMessagesPage":
      //   return CustomRoute<bool>(
      //     builder: (BuildContext context) => const DirectMessagesPage(),
      //   );
      // case "TrendsPage":
      //   return CustomRoute<bool>(
      //     builder: (BuildContext context) => const TrendsPage(),
      //   );
      // case "DataUsagePage":
      //   return CustomRoute<bool>(
      //     builder: (BuildContext context) => const DataUsagePage(),
      //   );
      // case "AccessibilityPage":
      //   return CustomRoute<bool>(
      //     builder: (BuildContext context) => const AccessibilityPage(),
      //   );
      // case "ProxyPage":
      //   return CustomRoute<bool>(
      //     builder: (BuildContext context) => const ProxyPage(),
      //   );
      // case "AboutPage":
      //   return CustomRoute<bool>(
      //     builder: (BuildContext context) => const AboutPage(),
      //   );
      // case "ConversationInformation":
      //   return CustomRoute<bool>(
      //     builder: (BuildContext context) => const ConversationInformation(),
      //   );
      // case "FollowerListPage":
      //   return CustomRoute<bool>(
      //     builder: (BuildContext context) => FollowerListPage(),
      //   );
      default:
        return onUnknownRoute(const RouteSettings(name: '/Feature'));
    }
  }

  static Route onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(
            settings.name!.split('/')[1],
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Text('${settings.name!.split('/')[1]} Comming soon..'),
        ),
      ),
    );
  }
}
