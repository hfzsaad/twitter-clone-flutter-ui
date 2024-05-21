import 'package:flutter/material.dart';
import 'package:twitter_clone/UI/authentication/sign_in_screen.dart';
import 'package:twitter_clone/UI/authentication/sign_up_screen.dart';
import 'package:twitter_clone/common_widgets/custom_button.dart';

import '../../utils/colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                height: 40,
                child: Image.asset('assets/images/twitter_icon_with_background.png'),
              ),
              const Spacer(),
              const Text('See what\'s happening in the world right now.',
                  style: TextStyle(
                    fontSize: 25,
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                width: MediaQuery.of(context).size.width,
                child: CustomButton(
                  label: "Create Account",
                  onPressed: () {
                    // var state = Provider.of<AuthState>(context, listen: false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  borderRadius: 30,
                ),
              ),
              const Spacer(),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  const Text(
                    'Have an account already?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 10),
                      child: Text(
                        ' Log in',
                        style: TextStyle(
                          fontSize: 14,
                          color: TwitterColor.dodgeBlue,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}

