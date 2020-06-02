import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'question.dart';

QuizeBrain quizeBrain = QuizeBrain();

void main(){
  runApp(QuizApp());
}
class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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



  List<Icon> ScoreSigns= [];

  void userCheckedAnswer(bool answer){
    setState(() {
    bool correctAnswer = quizeBrain.questionAnswer();
    if(answer == correctAnswer){
      ScoreSigns.add(Icon(Icons.check, color: Colors.green,));
    }else{
      ScoreSigns.add(Icon(Icons.clear, color: Colors.red,));
    }

      quizeBrain.increment();
    });
  }
//  List<String> questions = [
//    'Lighters were invented before matches.', //true
//    'The Spanish national anthem has no words.', //true
//    'Orangutans sleep standing up.', //false
//    'There are more moves in chess than there are atoms in the universe.', //true
//    'We eat an average of 4 house flies (not spiders) in our sleep every year.' //false
//  ];
//  List<bool> answers = [true,true,false,true,false];


  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizeBrain.questionPattern(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                ),
              ),
              onPressed: (){
              userCheckedAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                ),
              ),
              onPressed: (){
                userCheckedAnswer(false);

              },
            ),
          ),
        ),
        Row(
          children: ScoreSigns

        )
      ],
    );
  }
}

