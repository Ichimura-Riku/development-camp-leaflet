import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class Timelinelist extends StatefulWidget {
  final DateTime date;
  const Timelinelist({Key? key, required this.date}) : super(key: key);

  @override
  State<Timelinelist> createState() => _TimelinelistState();
}

class _TimelinelistState extends State<Timelinelist> {
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
    return Timeline.tileBuilder(
    builder: TimelineTileBuilder.fromStyle(
      contentsAlign: ContentsAlign.alternating,
      contentsBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text('Timeline Event $index'),
      ),
      itemCount: 10,
    ),
  );
;
  }
}

class Day2 extends StatelessWidget {
  const Day2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("timeline2");
  }
}
