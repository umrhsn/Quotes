import 'package:quotes/src/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<QuoteModel> cacheQuote(QuoteModel quoteModel);
}
