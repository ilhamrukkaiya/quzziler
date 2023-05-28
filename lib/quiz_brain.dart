import 'questions.dart';

class QuizBrian {
  int _questionNumber = 0;
  List<Questions> _questionBank = [
    Questions(
        questionText: "some cats are actually allergic to humans",
        questionAnswer: true),
    Questions(
        questionText: "you can lead a cow down stairs but not up stairs",
        questionAnswer: false),
    Questions(
        questionText:
            "Approximately one quarter of human bones are in the feet",
        questionAnswer: true),
    Questions(questionText: "A slug's blood is green", questionAnswer: true),
    Questions(
        questionText: "Buzz Aldrin's mother's maiden name was 'moon'",
        questionAnswer: true),
    Questions(
        questionText: "it is illegal to pee in the Ocean in portugal",
        questionAnswer: true),
    Questions(
        questionText:
            "no piece of square dry peper can be folded in half more then 7 day",
        questionAnswer: false),
    Questions(
        questionText:
            "In london ,UK,if you happen to die in the house of parliament ,you are technically",
        questionAnswer: true)
  ];

  void reset() {
    _questionNumber = 0;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
      print(_questionNumber);
      print(_questionBank.length);
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print("now returning true");
      return true;
    } else {
      return false;
    }
  }
}
