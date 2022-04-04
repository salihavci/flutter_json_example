import 'package:flutter/material.dart';
import 'package:flutter_json_example/local_json.dart';
import 'package:flutter_json_example/remote_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http JSON'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text(
                'Local JSON',
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LocalJson(),
                    ),
                  );
                });
              },
            ),
            ElevatedButton(
              child: const Text(
                'Remote API',
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RemoteApi(),
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
