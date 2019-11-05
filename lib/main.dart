import 'package:dart_study/class_learn.dart';
import 'package:dart_study/data_type.dart';
import 'package:dart_study/funaction_learn.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dart基础学习',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'dart基础学习'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    LoggerLearn();
    FunLearn();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: <Widget>[DataType()],
        ));
  }

  void LoggerLearn() {
    Logger logger = new Logger();
    Logger logger1 = new Logger();
    print("====logger == logger1====${logger == logger1}==");

    Worker worker = Worker.begin(Worker("121", "4353", "31", 22), "sh");
    worker.salary = 2200;
    print(worker.salary);
  }

  void FunLearn() {
    FunClass funClass = FunClass();
    print(funClass.fromWhere("格林国")); //我来自 格林国 哈哈村
    print(funClass.fromWhere("格林国", city: "童话镇"));//我来自 格林国 童话镇 哈哈村

    funClass.printI(999);
  }
}
