import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContainerAll extends StatelessWidget {
  Widget child;
  ContainerAll({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 250, 242, 249),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: child);
  }
}
