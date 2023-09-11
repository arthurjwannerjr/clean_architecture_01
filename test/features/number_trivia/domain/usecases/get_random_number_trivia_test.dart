import 'package:clean_architecture_01/core/usecases/usecase.dart';
import 'package:clean_architecture_01/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_01/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_01/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetRandomNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test(
    'should get trivia for a random number from the repository',
    () async {
      // arrange
      when(() => mockNumberTriviaRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => const Right(tNumberTrivia));

      // act
      // callable class, so we can simply call it like a function
      final result = await usecase(NoParams());

      // assert
      // UseCase should simply return whatever was returned from the Repository
      expect(result, const Right(tNumberTrivia));

      // Verify that the method has been called on the Repository
      verify(() => mockNumberTriviaRepository.getRandomNumberTrivia());

      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
