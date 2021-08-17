import 'package:flutter/material.dart';

class TopicsItem extends StatelessWidget {
  final String id;
  final String name;

  TopicsItem({
    required this.id,
    required this.name,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
      ),
    );
  }
}
