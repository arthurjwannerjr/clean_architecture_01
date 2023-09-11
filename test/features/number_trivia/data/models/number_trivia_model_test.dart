import 'dart:convert';
import 'package:clean_architecture_01/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_01/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/fixture_reader.dart';

// tests should not depend on actual api, they use fixtures

// data in fixtures can contain simple test values
// but must have all the fields and follow the given schema

void main() {
  const tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test Text');

  test(
    'should be a subclass of NumberTrivia entity',
    () async {
      // assert
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON number is an integer',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('trivia.json'));
        // act
        final result = NumberTriviaModel.fromJson(jsonMap);
        // assert
        expect(result, tNumberTriviaModel); // equals
      },
    );

    test(
      'should return a valid model when the JSON number is a double',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('trivia_double.json'));
        // act
        final result = NumberTriviaModel.fromJson(jsonMap);
        // assert
        expect(result, tNumberTriviaModel); // equals
      },
    );
  });

  group(
    'toJson',
    () {
      test(
        'should return a JSON map containing the proper data',
        () async {
          // act
          final result = tNumberTriviaModel.toJson();
          // assert
          final expectedMap = {
            "text": "Test Text",
            "number": 1,
            // note we ingore last two fields of schema
          };
          expect(result, expectedMap);
        },
      );
    },
  );
}
