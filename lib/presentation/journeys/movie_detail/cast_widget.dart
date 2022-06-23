import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/core/api_constants.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_app/presentation/theme/theme_text.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({Key? key}) : super(key: key);
  final dummyImage = 'https://cdn.pixabay.com/photo/2016/08/31/11/54/icon-1633249__340.png';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        if (state is CastLoaded) {
          final List<CastEntity> cast = state.cast;
          // print("rendered");
          return SizedBox(
            height: Sizes.dimen_100.h.toDouble(),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: cast.length,
              itemBuilder: (ctx, idx) {
                CastEntity castEntity = cast[idx];
                return SizedBox(
                  height: Sizes.dimen_100.h.toDouble(),
                  width: Sizes.dimen_160.w.toDouble(),
                  child: Card(
                    elevation: 1,
                    margin: EdgeInsets.symmetric(
                      horizontal: Sizes.dimen_8.w.toDouble(),
                      vertical: Sizes.dimen_4.h.toDouble(),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Sizes.dimen_8.w.toDouble()),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8.w.toDouble()),
                            ),
                            child: CachedNetworkImage(
                              height: Sizes.dimen_100.h.toDouble(),
                              width: Sizes.dimen_160.w.toDouble(),
                              imageUrl: '${ApiConstanst.BASE_IMG_URL}${castEntity.posterPath}',
                              errorWidget: (ctx,_,__) => Image.network(dummyImage),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Sizes.dimen_8.w.toDouble(),
                          ),
                          child: Text(
                            castEntity.name,
                            overflow: TextOverflow.fade,
                            style: Theme.of(context).textTheme.vulcanBodyText2,
                            maxLines: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: Sizes.dimen_8.w.toDouble(),
                            right: Sizes.dimen_8.w.toDouble(),
                            bottom: Sizes.dimen_2.h.toDouble(),
                          ),
                          child: Text(
                            castEntity.character,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        if (state is CastError) {
          return const Text("Error");
        }
        return const Text("Something else");
      },
    );
  }
}
