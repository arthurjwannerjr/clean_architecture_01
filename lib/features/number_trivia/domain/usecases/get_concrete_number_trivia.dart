import 'package:clean_architecture_01/core/error/failures.dart';
import 'package:clean_architecture_01/core/usecases/usecase.dart';
import 'package:clean_architecture_01/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repositories/number_trivia_repository.dart';

class Params extends Equatable {
  final int number;
  const Params({required this.number});

  @override
  List<Object?> get props => [number];
}

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;
  GetConcreteNumberTrivia(this.repository);

  // api.com/42 // concrete number api endpoint
  // api.com/random // random number api endpoint

  // implement 'callable class' to make the class callable like a function
  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}
