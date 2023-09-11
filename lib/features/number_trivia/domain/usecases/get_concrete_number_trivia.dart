import 'package:clean_architecture_01/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;
  GetConcreteNumberTrivia(this.repository);

  // implement 'callable class' to make it callable like a function
  Future<Either<Failure, NumberTrivia>> call({
    required int number,
  }) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
