import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/common/extensions/string_extension.dart';
import 'package:movie_app/presentation/app_localization.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app/presentation/journeys/home/movie_tab/movie_list_view_builder.dart';
import 'package:movie_app/presentation/journeys/home/movie_tab/movie_tab_card_widget.dart';
import 'package:movie_app/presentation/journeys/home/movie_tab/movie_tab_constants.dart';
import 'package:movie_app/presentation/journeys/home/movie_tab/tab_title_widget.dart';
import 'package:movie_app/presentation/widget/app_error_widget.dart';

class MovieTabbedWiget extends StatefulWidget {
  const MovieTabbedWiget({Key? key}) : super(key: key);

  @override
  State<MovieTabbedWiget> createState() => _MovieTabbedWigetState();
}

class _MovieTabbedWigetState extends State<MovieTabbedWiget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(
      MovieTabChangedEvent(
        currentTabIndex: currentTabIndex,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    movieTabbedBloc.close();
  }

  void _onTabTapped(int index) {
    movieTabbedBloc.add(
      MovieTabChangedEvent(
        currentTabIndex: index,
      ),
    );
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (ctx, state) {
        return Padding(
          padding: EdgeInsets.all(
            Sizes.dimen_4.h.toDouble(),
          ),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < MovieTabConstants.tabs.length; i++)
                    TabTitleWidget(
                      title: MovieTabConstants.tabs[i].title.trans(context),
                      isSelected: MovieTabConstants.tabs[i].index ==
                          state.currentTabIndex,
                      onTap: () {
                        _onTabTapped(i);
                      },
                    )
                ],
              ),
              if (state is MovieTabChange)
                state.movies.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(
                            TranslationConstant.noMovies.trans(context),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      )
                    : Expanded(
                        child: MovieListViewBuilder(
                          movies: state.movies,
                        ),
                      ),
              if (state is MovieTabLoadError)
                Expanded(
                  child: AppErrorWidget(
                      appErrorType: state.appErrorType,
                      onPressed: () {
                        movieTabbedBloc.add(MovieTabChangedEvent(
                          currentTabIndex: currentTabIndex,
                        ));
                      }),
                ),
            ],
          ),
        );
      },
    );
  }
}
