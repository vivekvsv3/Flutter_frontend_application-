import 'package:flutter/material.dart';
//import '../models/restaurant.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  HomeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
