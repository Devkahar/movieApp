import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/common/screenutil/screenutil.dart';
import 'package:movie_app/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:movie_app/presentation/journeys/search_movie/custom_search_movie_delegate.dart';

import '../../common/constants/size_constants.dart';
import 'logo.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
        left: Sizes.dimen_16.w.toDouble(),
        right: Sizes.dimen_16.w.toDouble(),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset('assets/svgs/menu.svg'),
          ),
          Expanded(
            child: Logo(
              height: Sizes.dimen_4.h.toDouble(),
            ),
          ),
          GestureDetector(
            onTap: () {
              showSearch(delegate: CustomSearchDelegate(
                BlocProvider.of<SearchMovieBloc>(context),
              ), context: context);
            },
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: Sizes.dimen_12.h.toDouble(),
            ),
          ),
        ],
      ),
    );
  }
}
