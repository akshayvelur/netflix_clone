import 'package:flutter/material.dart';

class MyNetflix extends StatefulWidget {
  const MyNetflix({super.key});

  @override
  State<MyNetflix> createState() => _MyNetflixState();
}

class _MyNetflixState extends State<MyNetflix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("my nextflixx"),
    );
  }
}
