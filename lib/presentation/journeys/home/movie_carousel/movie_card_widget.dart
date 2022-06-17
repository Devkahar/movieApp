import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/core/api_constants.dart';

import '../../../../common/constants/size_constants.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget(
      {Key? key, required this.movieId, required this.posterPath})
      : super(key: key);
  final int movieId;
  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      borderRadius: BorderRadius.circular(
        Sizes.dimen_16.w.toDouble(),
      ),
      child: GestureDetector(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            Sizes.dimen_16.w.toDouble(),
          ),
          child: Image.network(
            '${ApiConstanst.BASE_IMG_URL}$posterPath',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
