import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/common/extensions/string_extension.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/presentation/widget/button.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType appErrorType;
  final Function onPressed;

  const AppErrorWidget(
      {Key? key, required this.appErrorType, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.dimen_16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            appErrorType == AppErrorType.api
                ? TranslationConstant.somethingWentWrong.trans(context)
                : TranslationConstant.checkNetwork.trans(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          ButtonBar(
            children: [
              Button(
                title: TranslationConstant.retry,
                onPressed: ()=> onPressed(),
              ),
              Button(
                title: TranslationConstant.feedback,
                onPressed: () {
                  Wiredash.of(context)?.show();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
