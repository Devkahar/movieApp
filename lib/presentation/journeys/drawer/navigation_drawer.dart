import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/language_constants.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/common/extensions/string_extension.dart';
import 'package:movie_app/presentation/app_localization.dart';
import 'package:movie_app/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movie_app/presentation/journeys/drawer/navigation_expanded_list_item.dart';
import 'package:movie_app/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:movie_app/presentation/widget/logo.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      width: Sizes.dimen_300.w.toDouble(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_8.h.toDouble(),
                bottom: Sizes.dimen_18.h.toDouble(),
                left: Sizes.dimen_8.w.toDouble(),
                right: Sizes.dimen_8.w.toDouble(),
              ),
              child: Logo(
                height: Sizes.dimen_20.h.toDouble(),
              ),
            ),
            NavigationListItem(
              title: TranslationConstant.favouriteMovies.trans(context),
              onPressed: () {},
            ),
            NavigationExpandedListItem(
              title: TranslationConstant.languages.trans(context),
              children: const ['English', 'Spanish'],
              onPressed: (int index) {
                BlocProvider.of<LanguageBloc>(context).add(ToggleLanguageEvent(LanguagesConstants.languages[index]));
              },
            ),
            NavigationListItem(
              title: TranslationConstant.feedback.trans(context),
              onPressed: () {},
            ),
            NavigationListItem(
              title: TranslationConstant.about.trans(context),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}