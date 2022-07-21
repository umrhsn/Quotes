import 'package:dartz/dartz.dart';
import 'package:quotes/src/core/error/failures.dart';
import 'package:quotes/src/core/use_cases/use_case.dart';
import 'package:quotes/src/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/src/features/random_quote/domain/repositories/quote_repository.dart';

/// usecases handle business story.
/// repository is called by usecases.
/// examples of usecases:
/// 1- login.
/// 2- register.
/// 3- reset password.
/// 4- get product.
/// here it's get a random quote
/// */

class GetRandomQuote implements UseCase<Quote, NoParams> {
  final QuoteRepository quoteRepository;

  GetRandomQuote({required this.quoteRepository});
  @override
  Future<Either<Failure, Quote>> call(NoParams params) {
    return quoteRepository.getRandomQuote();
  }
}
