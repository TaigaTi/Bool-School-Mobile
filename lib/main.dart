import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Colors.blue.shade800,
                Colors.blue.shade900
              ]),
        ),
        child: Quiz(),
      ),
    );
  }
}

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 40,
            ),
            Text(
              'Bool School',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 20,
                  right: 20,
                  bottom: 0,
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(children: [
                    Image.asset(
                      'assets/header.png',
                      height: 115,
                    ),
                    Text(
                      'Boolean Algebra Quiz',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      'Simplifying Boolean Expressions',
                      style: TextStyle(
                        color: const Color.fromARGB(209, 255, 255, 255),
                        fontSize: 18,
                      ),
                    ),
                  ]),
                ]),
              ),
              QuestionCard(),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/home.png',
                  height: 40,
                ),
                Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/learn.png',
                    height: 40,
                  ),
                ),
                Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/quiz.png',
                    height: 40,
                  ),
                ),
                Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/profile.png',
                    height: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/left-arrow.png',
                    height: 50,
                  ),
                  Image.asset(
                    'assets/algebra.png',
                    height: 50,
                  ),
                  Image.asset(
                    'assets/right-arrow.png',
                    height: 50,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                'Question 1',
                style: TextStyle(
                  color: Colors.blue.shade800,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            SizedBox(
              width: 250,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Center(
                  child: Opacity(
                    opacity: 0.8,
                    child: Text(
                      'Boolean algebra is a branch of algebra that was formulated by _______',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  QuestionChoice(text: 'Rihanna Fenty'),
                  QuestionChoice(text: 'John Doe'),
                  QuestionChoice(text: 'George Boole'),
                  QuestionChoice(text: 'George Washington'),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            side: BorderSide(color: Colors.blue.shade900),
                            fixedSize: Size.fromWidth(200),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            backgroundColor:
                                const Color.fromARGB(71, 158, 158, 158),
                          ),
                          child: Text(
                            'Evaluate',
                            style: TextStyle(color: Colors.blue.shade900),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionChoice extends StatelessWidget {
  final String text;
  const QuestionChoice({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        fixedSize: Size.fromWidth(400),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        backgroundColor:
            const Color.fromARGB(71, 158, 158, 158), // Background color
      ),
      child: Text(
        text,
        style:
            TextStyle(color: Colors.blue.shade800, fontWeight: FontWeight.bold),
      ),
    );
  }
}
