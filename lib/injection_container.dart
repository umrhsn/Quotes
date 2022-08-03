import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes/src/core/network/network_info.dart';
import 'package:quotes/src/features/random_quote/data/data_sources/random_quote_local_data_source.dart';
import 'package:quotes/src/features/random_quote/data/data_sources/random_quote_remote_data_source.dart';
import 'package:quotes/src/features/random_quote/data/repositories/quote_repository_impl.dart';
import 'package:quotes/src/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:quotes/src/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:quotes/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance; // sl stands for serviceLocator

Future<void> init() async {
  /// features
  // blocs
  sl.registerFactory(() => RandomQuoteCubit(getRandomQuoteUseCase: sl()));
  // 1- registerFactory() is used to allow RandomQuoteCubit to have multiple instances for each screen and not depend on one instance only,
  //    a screen may be closed but its RandomQuoteCubit is still called which may cause unwanted behaviour.
  // 2- GetIt is a callable class; sl() === sl.call()

  // usecases
  sl.registerLazySingleton(() => GetRandomQuote(quoteRepository: sl()));
  // using lazy instead of normal allows it to instantiate only when init() is called, it's a better practice.

  // repository
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(
        networkInfo: sl(),
        randomQuoteRemoteDataSource: sl(),
        randomQuoteLocalDataSource: sl(),
      ));

  // data sources
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(client: sl()));

  /// core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));

  /// external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
