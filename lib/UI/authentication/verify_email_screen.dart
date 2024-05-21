import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class VerifyEmailScreen extends StatefulWidget {

  const VerifyEmailScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: TwitterColor.mystic,
      appBar: AppBar(
        title: const Text(
          'Email Verification',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Container(
        // height: context.height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const NotifyText(
              title: 'Verify your email address',
              subTitle:
              'Send email verification email link to "state.user!.email" to verify address',
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Wrap(
                children: <Widget>[
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.blueAccent,
                    onPressed: (){},
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: const Text(
                      'Send Link',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NotifyText extends StatelessWidget {
  final String? subTitle;
  final String? title;
  const NotifyText({Key? key, this.subTitle, this.title})
      : assert(title != null || subTitle != null,
  'title and subTitle must not be null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (title != null)
          Text(title!, style: const TextStyle(fontSize: 20), textAlign: TextAlign.center),
        if (subTitle != null) ...[
          const SizedBox(height: 20),
          Text(
            subTitle!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.darkGrey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}