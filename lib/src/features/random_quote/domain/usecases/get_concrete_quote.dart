import 'package:dartz/dartz.dart';
import 'package:quotes/src/core/error/failures.dart';
import 'package:quotes/src/core/usecases/usecase.dart';
import 'package:quotes/src/features/random_quote/domain/entities/quote.dart';

class GetConcreteQuote implements UseCase<Quote, NoParams> {
  @override
  Future<Either<Failure, Quote>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
