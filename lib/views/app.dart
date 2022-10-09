import 'package:flutter/material.dart';

import 'offices.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Offices',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const OfficesPage(title: 'Google Offices Page'),
    );
  }
}