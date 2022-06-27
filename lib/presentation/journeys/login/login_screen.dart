import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/presentation/journeys/login/login_form.dart';
import 'package:movie_app/presentation/widget/logo.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: Sizes.dimen_32.h.toDouble()),
              child: Logo(height: Sizes.dimen_12.h.toDouble()),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
