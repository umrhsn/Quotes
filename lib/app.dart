import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/src/config/locale/app_localizations_setup.dart';
import 'package:quotes/src/config/routes/app_routes.dart';
import 'package:quotes/src/config/themes/app_theme.dart';
import 'package:quotes/src/core/utils/app_strings.dart';
import 'package:quotes/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes/src/features/splash/presentation/cubit/locale_cubit.dart';
import 'injection_container.dart' as di;

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<LocaleCubit>()..getSavedLang()),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previousState, currentState) => previousState != currentState,
        builder: (context, state) => MaterialApp(
          title: AppStrings.appName,
          theme: AppThemes.light(),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.initialRoute,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          locale: state.locale,
          supportedLocales: AppLocalizationsSetup.supportedLocales,
          localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
          localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
        ),
      ),
    );
  }
}
