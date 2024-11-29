import 'package:flutter/material.dart';

class LearrnScreen extends StatefulWidget {
  const LearrnScreen({super.key});

  @override
  State<LearrnScreen> createState() => _LearrnScreenState();
}

class _LearrnScreenState extends State<LearrnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("learnScreen"),),);
  }
}
