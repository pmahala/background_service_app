import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = "TEXT";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(text),
              ElevatedButton(
                onPressed: () async {
                  var temp = await compute(timerDelay, "SAMPLE");
                  setState(() {
                    text = temp;
                  });
                },
                child: Text("UPDATE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<String> makeChangeToText(String s) async {
  print("RUNNING!!");
  int val = 1;
  while (val <= 3) {
    s = s + val.toString();
    print("VAL: $val");
    val++;
  }
  return s;
}

Future<String> timerDelay(String s) async {
  int val = 1;
  while (val < 10) {
    print('val $val');
    await Future.delayed(Duration(seconds: 3));
    val++;
  }
  return "COUNTED TILL 10!!!";
}
