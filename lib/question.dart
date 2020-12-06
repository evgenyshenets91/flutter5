class Question {
  String questionText;
  bool questionAnswer;

  // Without named params
  Question(this.questionText, this.questionAnswer);

  // With named params
  // Question({this.questionText, this.questionAnswer});

  // Possible solution

  // Question(String qstText, bool qstAsr) {
  //   questionText = qstText;
  //   questionAnswer = qstAsr;
  // }
}
