import 'package:quotes/src/core/api/api_consumer.dart';
import 'package:quotes/src/core/api/endpoint.dart';
import 'package:quotes/src/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  ApiConsumer apiConsumer;

  RandomQuoteRemoteDataSourceImpl({required this.apiConsumer});

  /// access api
  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(Endpoint.randomQuote);
    return QuoteModel.fromJson(response);
  }
}
