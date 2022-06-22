import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/common/extensions/string_extension.dart';
import 'package:movie_app/core/api_constants.dart';
import 'package:movie_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:movie_app/presentation/journeys/movie_detail/movie_detail_screen.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int id;
  final String title;
  final String posterPath;

  const MovieTabCardWidget(
      {Key? key, required this.title, required this.posterPath, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => MovieDetailScreen(
              movieDetailarguments: MovieDetailarguments(id),
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.dimen_16.w.toDouble()),
              child: Image.network(
                '${ApiConstanst.BASE_IMG_URL}$posterPath',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Sizes.dimen_10.h.toDouble(),
            ),
            child: Text(

              title.intelliTrim(),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}
