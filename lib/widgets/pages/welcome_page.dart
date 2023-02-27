import 'package:first_app/common/common_font.dart';
import 'package:first_app/common/route_wrapper.dart';
import 'package:first_app/widgets/common/common_widget.dart';
import 'package:flutter/material.dart';

class FWelcomePage extends StatefulWidget {
  const FWelcomePage({super.key});

  @override
  State<FWelcomePage> createState() => _FWelcomePageState();
}

class _FWelcomePageState extends State<FWelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FCommonWidget.appBarCenterTitle(
        '',
        context: context,
        // leadingIcon: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios_new_sharp),
        //   onPressed: () {},
        // ),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '오늘은 어떤 이야기가 숨어 있을까요?',
              style: TextStyle(
                fontFamily: FCommonFont.family,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            FCommonWidget.submitButton(
              context: context,
              label: 'Create Account',
              onPressed: () {
                FAppRoute.push(context, FRouteName.signIn);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '이미 계정이 있으신가요?',
                    style: TextStyle(fontFamily: FCommonFont.family, fontSize: 15),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      FAppRoute.push(context, FRouteName.signUp);
                    },
                    child: Text(
                      '로그인',
                      style: TextStyle(color: Colors.blue.shade400, fontFamily: FCommonFont.family, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
