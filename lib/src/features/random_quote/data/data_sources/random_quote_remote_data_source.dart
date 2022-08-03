import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quotes/src/core/api/endpoint.dart';
import 'package:quotes/src/core/error/exceptions.dart';
import 'package:quotes/src/core/utils/app_strings.dart';
import 'package:quotes/src/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  http.Client client;

  RandomQuoteRemoteDataSourceImpl({required this.client});

  /// access api
  /// TODO: api section will be refined
  @override
  Future<QuoteModel> getRandomQuote() async {
    final randomQuoteUrl = Uri.parse(Endpoint.randomQuote);
    final response = await client.get(randomQuoteUrl,
        headers: {AppStrings.contentType: AppStrings.applicationJson});
    if (response.statusCode == 200) {
      return QuoteModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
