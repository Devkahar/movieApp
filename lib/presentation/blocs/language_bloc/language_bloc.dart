import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/common/constants/language_constants.dart';
import 'package:movie_app/domain/entities/language_entity.dart';
import 'package:movie_app/domain/usecases/get_preffered_language.dart';
import 'package:movie_app/domain/usecases/no_params.dart';
import 'package:movie_app/domain/usecases/update_language.dart';

part 'language_event.dart';

part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetPrefferdLanguage getPrefferdLanguage;
  final UpdateLanguage updateLanguage;

  LanguageBloc({
    required this.getPrefferdLanguage,
    required this.updateLanguage,
  }) : super(
            LanguageLoadedState(Locale(LanguagesConstants.languages[0].code))) {
    on<ToggleLanguageEvent>(
      (event, emit) async {
        await updateLanguage(event.languageEntity.code);

        add(LoadPrefferedLanguageEvent());
      },
    );
    on<LoadPrefferedLanguageEvent>(
      (event, emit) async {
        final res = await getPrefferdLanguage(NoParams());
        final data = res.fold(
          (l) => LanguageError(),
          (r) => LanguageLoadedState(
            Locale(r),
          ),
        );
        emit(data);
      },
    );
  }
}
