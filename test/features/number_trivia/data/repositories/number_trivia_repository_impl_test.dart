import 'package:clean_architecture_01/core/platform/network_info.dart';
import 'package:clean_architecture_01/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:clean_architecture_01/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:clean_architecture_01/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:clean_architecture_01/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock
    implements NumberTriviaRemoteDataSource {}

class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  NumberTriviaRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    // ignore: prefer_const_constructors
    mockRemoteDataSource = MockRemoteDataSource();
    // ignore: prefer_const_constructors
    mockLocalDataSource = MockLocalDataSource();
    // ignore: prefer_const_constructors
    mockNetworkInfo = MockNetworkInfo();
    // ignore: prefer_const_constructors
    repository = NumberTriviaRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
}
