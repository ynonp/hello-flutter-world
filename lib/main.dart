import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  final secondsController = TextEditingController();
  final minutesController = TextEditingController();
  final hoursController = TextEditingController();

  setTime(String value, int factor) {
    try {
      double seconds = double.parse(value) * factor;
      String secondsText = seconds.toStringAsFixed(2);
      String hoursText = (seconds / 3600).toStringAsFixed(2);
      String minutesText = (seconds / 60).toStringAsFixed(2);

      if (factor != 1) {
        secondsController.text = secondsText;
      }

      if (factor != 60) {
        minutesController.text = minutesText;
      }

      if (factor != 3600) {
        hoursController.text = hoursText;
      }
    } on FormatException { }
  }

  @override
  void dispose() {
      secondsController.dispose();
      minutesController.dispose();
      hoursController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Seconds: "),
            TextField(controller: secondsController, onChanged: (String newValue) {
              setTime(newValue, 1);
            }),
            Text("Minutes: "),
            TextField(controller: minutesController, onChanged: (String newValue) {
              setTime(newValue, 60);
            }),
            Text("Hours: "),
            TextField(controller: hoursController, onChanged: (String newValue) {
              setTime(newValue, 3600);
            }),
          ],
        ),
      ),
    );
  }
}
