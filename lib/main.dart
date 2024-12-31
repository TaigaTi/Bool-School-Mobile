import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'navbar.dart';
import 'questions.dart';

void main() {
  runApp(const MainApp());
}

final selectedButtonProvider = StateProvider<int?>((ref) => null);
final questionProvider = StateProvider<int>((ref) => 0);
final evaluateButtonProvider =
    StateProvider<Color>((ref) => const Color.fromARGB(71, 158, 158, 158));

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
        title: Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 15,
            right: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 35,
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
                size: 35,
                color: Colors.white,
              )
            ],
          ),
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

class QuestionCard extends ConsumerWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionIndex = ref.watch(questionProvider);

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
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: const Color.fromARGB(187, 158, 158, 158),
                    ),
                    onPressed: () {
                      final currentIndex =
                          ref.read(questionProvider.notifier).state;

                      if (currentIndex > 0) {
                        ref.read(questionProvider.notifier).state--;
                        ref.read(evaluateButtonProvider.notifier).state =
                            const Color.fromARGB(71, 158, 158, 158);
                      }
                    },
                  ),
                  Image.asset(
                    'assets/algebra.png',
                    height: 50,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: const Color.fromARGB(187, 158, 158, 158),
                    ),
                    onPressed: () {
                      final currentIndex =
                          ref.read(questionProvider.notifier).state;

                      if (currentIndex < questions.length - 1) {
                        ref.read(questionProvider.notifier).state++;
                        ref.read(evaluateButtonProvider.notifier).state =
                            const Color.fromARGB(71, 158, 158, 158);
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                'Question ${questionIndex + 1}',
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
                      questions[questionIndex]['question'] as String,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: (questions[questionIndex]['options'] as List<String>)
                    .map((option) {
                  return ChoiceButton(
                    text: option,
                    index: (questions[questionIndex]['options'] as List<String>)
                        .indexOf(option),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      final selectedIndex = ref.read(selectedButtonProvider);
                      final isCorrect =
                          questions[questionIndex]['answer'] == selectedIndex;

                      ref.read(evaluateButtonProvider.notifier).state =
                          isCorrect
                              ? Colors.green.shade400
                              : Colors.red.shade400;
                    },
                    style: TextButton.styleFrom(
                      side: BorderSide(color: Colors.blue.shade900),
                      fixedSize: Size.fromWidth(200),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      backgroundColor: ref.watch(evaluateButtonProvider),
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
        ref.read(evaluateButtonProvider.notifier).state =
            const Color.fromARGB(71, 158, 158, 158);
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
