import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/state/authState.dart';
import 'package:twitter_clone/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthState>(create: (_) => AuthState()),
        ],
        child: MaterialApp(
          title: 'Twitter Clone',
          debugShowCheckedModeBanner: false,
          routes: Routes.route(),
          onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
          onUnknownRoute: (settings) => Routes.onUnknownRoute(settings),
          initialRoute: "WelcomePage",
        ));
  }
}
