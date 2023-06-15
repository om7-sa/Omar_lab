import 'package:flutter/material.dart';

class LabelScreen extends StatelessWidget {
  const LabelScreen({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(48.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
      ),
    ));
  }
}
