import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'navbar.dart';

void main() {
  runApp(const MainApp());
}

final selectedButtonProvider = StateProvider<int?>((ref) => null);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Bool School',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            Icon(
              Icons.menu,
              size: 40,
              color: Colors.white,
            )
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
          NavBar(),
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
                  ChoiceButton(
                    text: 'Rihanna Fenty',
                    index: 0,
                  ),
                  ChoiceButton(
                    text: 'John Doe',
                    index: 1,
                  ),
                  ChoiceButton(
                    text: 'George Boole',
                    index: 2,
                  ),
                  ChoiceButton(
                    text: 'George Washington',
                    index: 3,
                  ),
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

class ChoiceButton extends ConsumerWidget {
  final String text;
  final int index;
  const ChoiceButton({super.key, required this.text, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedButtonProvider);
    final isSelected = selectedIndex == index;
    final backgroundColor = isSelected
        ? Colors.blue.shade100
        : const Color.fromARGB(71, 158, 158, 158);

    return TextButton(
      onPressed: () {
        ref.read(selectedButtonProvider.notifier).state = index;
      },
      style: TextButton.styleFrom(
        fixedSize: Size.fromWidth(400),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        backgroundColor: backgroundColor, // Background color
      ),
      child: Text(
        text,
        style:
            TextStyle(color: Colors.blue.shade800, fontWeight: FontWeight.bold),
      ),
    );
  }
}
