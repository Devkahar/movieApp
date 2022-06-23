import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/common/extensions/string_extension.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:movie_app/presentation/journeys/search_movie/search_movie_card.dart';
import 'package:movie_app/presentation/theme/theme_color.dart';
import 'package:movie_app/presentation/theme/theme_text.dart';
import 'package:movie_app/presentation/widget/app_error_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  SearchMovieBloc searchMovieBloc;

  CustomSearchDelegate(this.searchMovieBloc);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.vulcan,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.greySubtitle1,
        focusColor: AppColor.vulcan,
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: query.isEmpty ? null : () => query = '',
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : Colors.white,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        size: Sizes.dimen_12.h.toDouble(),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMovieBloc.add(
      SearchTermChangedEvent(
        searchTerm: query,
      ),
    );
    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
      bloc: searchMovieBloc,
      builder: (ctx, state) {
        if (state is SearchMovieLoaded) {
          List<MovieEntity> movies = state.movieList;
          if (movies.isEmpty) {
            return Center(
              child: Text(
                TranslationConstant.noMoviesSearched.trans(context),
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (ctx, idx) => SearchMovieCard(movie: movies[idx]),
            itemCount: movies.length,
          );
        } else if (state is SearchMovieLoading) {
          return const Center(
            child: Text('Loading'),
          );
        } else if (state is SearchMovieError) {
          return AppErrorWidget(
            onPressed: () => searchMovieBloc.add(SearchTermChangedEvent(
              searchTerm: query,
            )),
            appErrorType: state.appErrorType,
          );
        }
        return const Center(
          child: Text('Some thing Went wrong.'),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return const SizedBox.shrink();
  }
}
