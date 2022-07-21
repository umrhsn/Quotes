import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

/// we will have 2 types of failure
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
