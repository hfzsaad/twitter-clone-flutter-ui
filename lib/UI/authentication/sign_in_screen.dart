import 'package:flutter/material.dart';
import 'package:twitter_clone/UI/home/home_screen.dart';
import 'package:twitter_clone/common_widgets/text_field.dart';

import '../../common_widgets/custom_button.dart';
import '../../utils/colors.dart';

class SignInScreen extends StatefulWidget {

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Sign in', style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 150),
              CustomTextFormField(
                  hint: 'Enter email', controller: _emailController),
              CustomTextFormField(
                  hint: 'Enter password',
                  controller: _passwordController,
                  isPassword: true),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 35),
                child: CustomButton(
                  label: "Submit",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  borderRadius: 30,
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/ForgetPasswordPage');
                },
                child: Text(
                  'Forget password?',
                  style: TextStyle(
                      color: TwitterColor.dodgeBlue,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              // GoogleLoginButton(
              //   loginCallback: widget.loginCallback!,
              //   loader: loader,
              // ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
