import 'package:clean_architecture_01/features/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  const NumberTriviaModel({
    required int number,
    required String text,
  }) : super(number: number, text: text);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> jsonMap) {
    return NumberTriviaModel(
      // as num is a double or int to make sure cast works for both
      number: (jsonMap['number'] as num).toInt(),
      text: jsonMap['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'number': number,
    };
  }
}
