
import 'dart:io';

import 'package:flutter/material.dart';
import 'quiz/quiz.dart';
import 'weather/weather.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final envFile = File('.env');
  print('🚨 Fichier .env trouvé ? ${await envFile.exists()}');

  if (!envFile.existsSync()) {
    print('❌ Fichier .env absent ou mal placé.');
  } else {
    await dotenv.load(fileName: ".env");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.quiz), text: "Quiz"),
              Tab(icon: Icon(Icons.cloud), text: "Weather")
            ]),
            title: Text('II-BDCC'),
          ),
          body: TabBarView(
            children: [Quiz(), Weather()],
          ),
        ),
      ),
    );
  }
}
