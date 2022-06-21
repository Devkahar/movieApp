import 'package:flutter/material.dart';
import 'package:movie_app/presentation/theme/theme_color.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  final String languageCode;

  const WiredashApp({Key? key, required this.navigatorKey, required this.child, required this.languageCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'movieapp-cmocbaj',
      secret: 'cH898lR2c2L3XrJgCTUf07Ier0MNHR96',
      navigatorKey: navigatorKey,
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.royalBlue,
        secondaryColor: AppColor.violet,
        secondaryBackgroundColor: AppColor.vulcan,
        dividerColor: AppColor.vulcan,
      ),
      options: WiredashOptionsData(
        locale: Locale(languageCode),
      ),
      child: child
    );
  }
}
