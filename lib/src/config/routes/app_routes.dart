import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/injection_container.dart' as di;
import 'package:quotes/src/core/utils/app_strings.dart';
import 'package:quotes/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes/src/features/random_quote/presentation/screens/quote_screen.dart';

class Routes {
  static const String initialRoute = ''; // *
  static const String favoriteQuoteRoute = 'favoriteQuote';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) {
          return BlocProvider(
            create: (context) => di.sl<RandomQuoteCubit>(),
            child: const QuoteScreen(),
          );
        }));
      case Routes.favoriteQuoteRoute:
      // return MaterialPageRoute(
      //     builder: (context) => const FavoriteQuoteScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}

/**
 * TODO: read about this error
 *
 * when route was initially '\' it gave this error:
 *
 * The following assertion was thrown building MaterialApp(dirty, state: _MaterialAppState#d4519):
    If the home property is specified, the routes table cannot include an entry for "/", since it would be redundant.
    'package:flutter/src/widgets/app.dart':
    Failed assertion: line 345 pos 10: 'home == null ||
    !routes.containsKey(Navigator.defaultRouteName)'


    Either the assertion indicates an error in the framework itself, or we should provide substantially more information in this error message to help you determine and fix the underlying cause.
    In either case, please report this assertion by filing a bug on GitHub:
    https://github.com/flutter/flutter/issues/new?template=2_bug.md
 * */
