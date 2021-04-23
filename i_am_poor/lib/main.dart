import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('I am poor')),
          backgroundColor: Colors.deepPurple[500],
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/coal.png'),
          ),
        ),
        backgroundColor: Colors.deepPurple[200],
      ),
    ),
  );
}
