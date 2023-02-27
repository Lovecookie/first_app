import 'package:first_app/common/common_function.dart';
import 'package:first_app/common/route_wrapper.dart';
import 'package:first_app/widgets/common/common_widget.dart';

import 'package:flutter/material.dart';

class FSignUpPage extends StatefulWidget {
  const FSignUpPage({super.key});

  @override
  State<FSignUpPage> createState() => _FSignUpPageState();
}

class _FSignUpPageState extends State<FSignUpPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

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
      appBar: FCommonWidget.appBarCenterTitle(
        'Sign up',
        context: context,
        leadingIcon: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: ownerColorScheme(context).primary,
          ),
          onPressed: () {
            FAppRoute.pop(context);
          },
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              FCommonWidget.flatTextField('Email', controller: _emailController, isEmail: true),
              FCommonWidget.flatTextField('Password', controller: _passwordController, isPassword: true),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: FCommonWidget.submitButton(
                  context: context,
                  label: 'Login',
                  onPressed: () {
                    _onSubmit(context);
                  },
                ),
              )
            ]),
          ),
        ));
      },
    ));
  }

  void _onSubmit(BuildContext context) {
    FAppRoute.go(context, FRouteName.home);
  }
}
