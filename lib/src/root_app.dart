import 'package:class_project/src/screen/jobs_screen.dart';
import 'package:flutter/material.dart';

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: JobsScreen(),
    );
  }
}