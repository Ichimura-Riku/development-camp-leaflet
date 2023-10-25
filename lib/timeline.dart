import 'package:flutter/material.dart';

class Timeline extends StatefulWidget {
  final DateTime date;
  const Timeline({Key? key, required this.date}) : super(key: key);

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: widget.date == DateTime(2023, 11, 11) ? const Day1() : const Day2()));
  }
}

class Day1 extends StatelessWidget {
  const Day1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("timeline1");
  }
}

class Day2 extends StatelessWidget {
  const Day2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("timeline2");
  }
}
