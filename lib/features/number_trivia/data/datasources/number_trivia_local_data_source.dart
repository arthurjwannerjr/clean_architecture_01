import 'package:clean_architecture_01/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  /// Gets the cached [NumberTriviaModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws a [CacheException] if no cached data is present.
  Future<NumberTriviaModel> getLastNumberTrivia();

  /// Cache the [NumberTriviaModel] to the local database.
  ///
  /// Throws a [CacheException] for all error codes.
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}
