import 'package:flutter/material.dart';
import 'package:twitter_clone/common_widgets/text_field.dart';

import '../../common_widgets/custom_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    _emailController.text = '';
    _focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password', style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: Container(
          // height: context.height,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Column(
                children: <Widget>[
                  Text('Forget Password',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                        'Enter your email address below to receive password reset instruction',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                        textAlign: TextAlign.center),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextFormField(
                  hint: 'Enter email', controller: _emailController),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                width: MediaQuery.of(context).size.width,
                child: CustomButton(
                  label: "Submit",
                  onPressed: () {},
                  borderRadius: 30,
                ),
              )
            ],
          )),
    );
  }
}
