import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.brown,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    if (userAnswer == correctAnswer) {
      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
    } else {
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, color: Colors.white)),
              ),
            )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(15),
          child: FlatButton(
            child: Text(
              'True',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              checkAnswer(true);

              setState(() {
                quizBrain.nextQuestion();
              });
            },
            color: Colors.green,
          ),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(15),
          child: FlatButton(
            child: Text(
              'False',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              checkAnswer(false);

              setState(() {
                quizBrain.nextQuestion();
              });
            },
            color: Colors.blue,
          ),
        )),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
