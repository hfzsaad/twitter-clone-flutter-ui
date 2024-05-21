import 'package:flutter/material.dart';
import 'package:twitter_clone/common_widgets/text_field.dart';

import '../../common_widgets/custom_button.dart';
import '../home/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomTextFormField(hint: 'Name', controller: _nameController),
            CustomTextFormField(
                hint: 'Enter email',
                controller: _emailController,
                isEmail: true),
            CustomTextFormField(
                hint: 'Enter password',
                controller: _passwordController,
                isPassword: true),
            CustomTextFormField(
                hint: 'Confirm password',
                controller: _confirmController,
                isPassword: true),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 35),
              child: CustomButton(
                label: "Sign up",
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  )
                },
                borderRadius: 30,
              ),
            ),
            const Divider(height: 30),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
