
import 'package:flutter/material.dart';


class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
