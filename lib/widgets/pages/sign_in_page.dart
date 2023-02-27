import 'package:first_app/common/common_function.dart';
import 'package:first_app/common/route_wrapper.dart';
import 'package:first_app/common/utility.dart';
import 'package:first_app/widgets/common/common_widget.dart';

import 'package:flutter/material.dart';

class FSignInPage extends StatefulWidget {
  const FSignInPage({
    super.key,
  });

  @override
  State<FSignInPage> createState() => _FSignInPageState();
}

class _FSignInPageState extends State<FSignInPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmController;

  final _fromGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FCommonWidget.appBarCenterTitle(
        'Sign in',
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FCommonWidget.flatTextField('Name', controller: _nameController),
                FCommonWidget.flatTextField('Enter email', controller: _emailController, isEmail: true),
                FCommonWidget.flatTextField('Enter password', controller: _passwordController, isPassword: true),
                FCommonWidget.flatTextField('Confirm password', controller: _confirmController, isPassword: true),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: FCommonWidget.submitButton(
                      context: context, label: 'Sign up', onPressed: () => _submitForm(context)),
                ),
              ],
            ),
          ),
        ));
      },
    ));

    // return Container(
    //   height: MediaQuery.of(context).size.height - 88,
    //   padding: const EdgeInsets.symmetric(horizontal: 40),
    //   child: Form(
    //       key: _fromGlobalKey,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: <Widget>[
    //           FCommonWidget.flatTextField('Name', controller: _nameController),
    //           FCommonWidget.flatTextField('Enter email', controller: _emailController, isEmail: true),
    //           FCommonWidget.flatTextField('Enter password', controller: _passwordController, isPassword: true),
    //           FCommonWidget.flatTextField('Confirm password', controller: _confirmController, isPassword: true),
    //           Container(
    //             margin: const EdgeInsets.symmetric(vertical: 20),
    //             child: FCommonWidget.submitButton(
    //                 context: context, label: 'Sign up', onPressed: () => _submitForm(context)),
    //           ),
    //         ],
    //       )),
    // );
  }

  // Widget _entryField(String hint,
  //     {required TextEditingController controller, bool isPassword = false, bool isEmail = false}) {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(vertical: 15),
  //     decoration: BoxDecoration(
  //       color: Colors.grey.shade200,
  //       borderRadius: BorderRadius.circular(30),
  //     ),
  //     child: TextField(
  //       controller: controller,
  //       keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
  //       style: const TextStyle(
  //         fontStyle: FontStyle.normal,
  //         fontWeight: FontWeight.normal,
  //       ),
  //       obscureText: isPassword,
  //       decoration: InputDecoration(
  //         hintText: hint,
  //         border: InputBorder.none,
  //         focusedBorder: const OutlineInputBorder(
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(30.0),
  //           ),
  //           borderSide: BorderSide(color: Colors.blue),
  //         ),
  //         contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
  //       ),
  //     ),
  //   );
  // }

  // Widget _submitButton(BuildContext context) {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(vertical: 35),
  //     child: FFlatButton(
  //       label: 'Sign up',
  //       onPressed: () => _submitForm(context),
  //       borderRadius: 30,
  //     ),
  //   );
  // }

  void _submitForm(BuildContext context) {
    if (_emailController.text.isEmpty) {
      FUtility.customSnackBar(context, 'Please enter name');
      return;
    }
    if (_emailController.text.length > 27) {
      FUtility.customSnackBar(context, 'Name length cannot exceed 27 character');
      return;
    }
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      FUtility.customSnackBar(context, 'Please fill form carefully');
      return;
    } else if (_passwordController.text != _confirmController.text) {
      FUtility.customSnackBar(context, 'Password and confirm password did not match');
      return;
    }

    FAppRoute.go(context, FRouteName.home);
  }
}
