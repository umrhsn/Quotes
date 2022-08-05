import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quotes/src/core/usecases/usecase.dart';
import 'package:quotes/src/core/utils/app_strings.dart';
import 'package:quotes/src/features/splash/domain/usecases/change_lang.dart';
import 'package:quotes/src/features/splash/domain/usecases/get_saved_lang.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLangUseCase changeLangUseCase;

  LocaleCubit({required this.getSavedLangUseCase, required this.changeLangUseCase})
      : super(const ChangeLocaleState(Locale(AppStrings.englishCode)));

  // get saved language
  String currentLangCode = AppStrings.englishCode;

  Future<void> getSavedLang() async {
    final response = await getSavedLangUseCase.call(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = value!;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }

// change locale
  Future<void> _changeLang(String langCode) async {
    final response = await getSavedLangUseCase.call(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = langCode;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }

  void toArabic() => _changeLang(AppStrings.arabicCode);

  void toEnglish() => _changeLang(AppStrings.englishCode);
}
