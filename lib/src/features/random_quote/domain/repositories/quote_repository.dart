import 'package:dartz/dartz.dart';
import 'package:quotes/src/core/error/failures.dart';
import 'package:quotes/src/features/random_quote/domain/entities/quote.dart';

abstract class QuoteRepository {
  Future<Either<Failure, Quote>> getRandomQuote();
} // abstract because in domain layer, this is a contract, should be interface, there are no interfaces in dart so we use abstract class
// contract details are set in domain layer, but implementation is hidden in data layer
