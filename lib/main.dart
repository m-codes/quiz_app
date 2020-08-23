import 'package:flutter/material.dart';
import 'question.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
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
        q: 'In an instance method or a constructor, "this" is a reference to the current object?',
        a: true),
    Question(q: 'Garbage Collection is manual process?', a: false),
    Question(q: 'Assignment operator is evaluated Left to Right?', a: false),
  ];

  int questionsNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionsNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                bool correctAnswer = questionBank[questionsNumber].questionAnswer;
                if (correctAnswer == true) {
                  //correct
                } else {
                  //wrong
                }
                setState(
                  () {
                    if (questionsNumber + 1 < questionBank.length) {
                      questionsNumber++;
                    }
                  },
                );
              },
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                bool correctAnswer = questionBank[questionsNumber].questionAnswer;

                if (correctAnswer == false) {
                  //correct
                } else {
                  //wrong
                }

                setState(
                  () {
                    if (questionsNumber + 1 < questionBank.length) {
                      questionsNumber++;
                    }
                  },
                );
              },
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
