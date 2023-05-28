import 'package:flutter/material.dart';
import 'questions.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrian quizBrian = QuizBrian();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Quizzler(),
    );
  }
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: QuizPage(),
      )),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> ScoreKeeper = [];
  // List<String> questions = [
  //   "you can lead a cow down stairs but not up stairs",
  //   "Approximately one quarter ofhuman bones are in the feet",
  //   "A slug\'s blood is green"
  // ];
  // List<bool> answers = [false, true, true];
  // Questions q1 = Questions(
  //     questionText: "you can lead a cow down stairs but not up stairs",
  //     questionAnswer: false);
  // Questions q2 = Questions(
  //     questionText: "Approximately one quarter ofhuman bones are in the feet",
  //     questionAnswer: true);
  // Questions q3 =
  //     Questions(questionText: "A slug\'s blood is green", questionAnswer: true);
  // List<Questions> questionsBank = [
  //   Questions(
  //       questionText: "you can lead a cow down stairs but not up stairs",
  //       questionAnswer: false),
  //   Questions(
  //       questionText: "Approximately one quarter ofhuman bones are in the feet",
  //       questionAnswer: true),
  //   Questions(questionText: "A slug\'s blood is green", questionAnswer: true),
  // ];

  // int questionNumber = 0;
  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "Finished",
      desc: "you are reached end in quiz.",
    ).show();
  }

  void checkAnswer(bool userPickedAnswer) {
    setState(() {
      bool correctAnswer = quizBrian.getCorrectAnswer();
      if (quizBrian.isFinished() == true) {
        _onBasicAlertPressed(context);
        quizBrian.reset;
        ScoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          ScoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          ScoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }

        quizBrian.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  quizBrian.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: TextButton(
            onPressed: () {
              checkAnswer(true);
            },
            style: TextButton.styleFrom(backgroundColor: Colors.green),
            child: Text(
              "ture",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: TextButton(
            onPressed: () {
              // quizBrian.questionBank[questionNumber].questionAnswer = true;
              checkAnswer(false);
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text(
              "false",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        )),
        Row(
          children: ScoreKeeper,
        )
      ],
    );
  }
}
