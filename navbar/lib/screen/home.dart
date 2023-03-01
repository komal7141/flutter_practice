import 'package:flutter/material.dart';
import 'package:navbar/NavBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/1.jpg'),
            ),
          ),
    );
  }
}