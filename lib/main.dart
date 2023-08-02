import 'package:flutter/material.dart';
import 'domain/HttpParser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WSA-IPSACH NOTIFIER',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String windParameter = 'N/A';

  Future<void> fetchData() async {
    windParameter = await fetchDataDoublePoint(
        'https://wsa-ipsach.meteobase.ch', 'Wind-10min-Ø:');

    setState(() {}); // Update the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wind Parameter Extractor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Wind-10min-Ø:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              windParameter,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: fetchData,
              child: Text('Fetch Wind Parameter'),
            ),
          ],
        ),
      ),
    );
  }
}
