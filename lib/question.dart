import 'quesions.dart';
class QuizeBrain{
  List<Questions> _questionList = [
    Questions(q: 'Lighters were invented before matches.', a: true),
    Questions(q: 'The Spanish national anthem has no words.', a: true),
    Questions(q: 'Orangutans sleep standing up.', a: false),
    Questions(q: 'There are more moves in chess than there are atoms in the universe.', a: true),
    Questions(q: 'We eat an average of 4 house flies (not spiders) in our sleep every year.', a: false),
  ];

  String questionPattern(int number){
    return _questionList[number].questions;
  }
  bool questionAnswer(int number){
    return _questionList[number].questionAnswer;
  }
}