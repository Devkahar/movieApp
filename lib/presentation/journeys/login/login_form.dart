import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/route_constant.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/common/extensions/string_extension.dart';
import 'package:movie_app/presentation/blocs/login/login_bloc.dart';
import 'package:movie_app/presentation/journeys/login/label_field_widget.dart';
import 'package:movie_app/presentation/theme/theme_text.dart';
import 'package:movie_app/presentation/widget/button.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _userNameController, _passwordController;
  bool enableSignIn = false;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();

    _userNameController.addListener(() {
      setState(() {
        enableSignIn = _userNameController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        enableSignIn = _userNameController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_32.w.toDouble(),
        vertical: Sizes.dimen_24.h.toDouble(),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: Sizes.dimen_8.h.toDouble()),
            child: Text(
              TranslationConstant.loginToMovieApp.trans(context),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          LabelFieldWidget(
            label: TranslationConstant.username.trans(context),
            hintText: TranslationConstant.enterTMDbUsername.trans(context),
            controller: _userNameController,
          ),
          LabelFieldWidget(
            label: TranslationConstant.password.trans(context),
            hintText: TranslationConstant.enterPassword.trans(context),
            controller: _passwordController,
            isPasswordField: true,
          ),
          BlocConsumer<LoginBloc, LoginState>(
            buildWhen: (previous, current) => current is LoginError,
            builder: (context, state) {
              if (state is LoginError) {
                return Text(
                  state.message.trans(context),
                  style: Theme.of(context).textTheme.orangeSubtitle1,
                );
              }
              return const SizedBox.shrink();
            },
            listenWhen: (previous, current) => current is LoginSuccess,
            listener: (context, state) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteList.home_screen,
                    (route) => false,
              );
            },
          ),
          Button(
            isEnabled: enableSignIn,
            onPressed: enableSignIn == false
                ? null
                : () {
                    BlocProvider.of<LoginBloc>(context).add(
                      LoginInitiateEvent(
                        _userNameController.text,
                        _passwordController.text,
                      ),
                    );
                  },
            title: TranslationConstant.signIn,
          ),
        ],
      ),
    );
  }
}
