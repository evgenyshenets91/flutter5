import 'package:flutter/material.dart';

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
  List<Icon> scoreKeeper = [
    Icon(
      Icons.check,
      color: Colors.lightGreen,
    ),
    Icon(
      Icons.close,
      color: Colors.black,
    ),
  ];

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
                child: Text('This is where the question text will go',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, color: Colors.white)),
              ),
            )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(15),
          child: FlatButton(
            onPressed: () {
              setState(() {
                scoreKeeper.add(Icon(
                  Icons.check,
                  color: Colors.green,
                ));
              });
            },
            color: Colors.green,
            child: Text(
              'True',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(15),
          child: FlatButton(
            onPressed: () {
              setState(() {
                scoreKeeper.add(Icon(
                  Icons.close,
                  color: Colors.red,
                ));
              });
            },
            color: Colors.blue,
            child: Text(
              'False',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        )),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
