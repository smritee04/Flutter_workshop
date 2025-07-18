
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<String> titles = ['login', 'sign up', 'refreshing', 'logout'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Dynamic Buttons')),
        body: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return CustomButton(title: titles[index]);
          },
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;

  CustomButton({required this.title});

  Color get color {
    switch (title.toLowerCase()) {
      case 'login':
        return Colors.green;
      case 'sign up':
        return Colors.blue;
      case 'refreshing':
        return Colors.orange;
      case 'logout':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: () => print('$title button pressed'),
        child: Text(title.toUpperCase(), style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
