import 'package:flutter/material.dart';
import 'package:flutter5/question.dart';

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

  List<Question> questionBank = [
    Question(
      qstText: 'You can lead a cow down stairs but not up stairs',
      qstAsr: false,
    ),
    Question(
      qstText: 'Approximately one quarter of human bones are in the feet',
      qstAsr: true,
    ),
    Question(
      qstText: 'A slug\'s blood is green',
      qstAsr: true,
    ),
  ];

  int questionNumber = 0;

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
                child: Text(questionBank[questionNumber].questionText,
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
              bool correctAnswer = questionBank[questionNumber].questionAnswer;
              if (correctAnswer == true) {
                print('right');
              } else {
                print('wrong');
              }
              setState(() {
                questionNumber++;
                // scoreKeeper.add(Icon(
                //   Icons.check,
                //   color: Colors.green,
                // ));
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
              bool correctAnswer = questionBank[questionNumber].questionAnswer;
              if (correctAnswer == false) {
                print('right');
              } else {
                print('wrong');
              }
              setState(() {
                questionNumber++;
                // scoreKeeper.add(Icon(
                //   Icons.close,
                //   color: Colors.red,
                // ));
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
