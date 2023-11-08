import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Day2Timeline extends StatelessWidget {
  const Day2Timeline({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (int i = 0; i < Day2.time.length; i++) ...{
        TimelineTile(
            indicatorStyle: const IndicatorStyle(width: 10, color: Colors.greenAccent),
            beforeLineStyle: const LineStyle(color: Colors.greenAccent),
            alignment: TimelineAlign.manual,
            lineXY: 0.2,
            startChild: Container(
              alignment: Alignment.center,
              height: 35,
              child: Text(
                Day2.time[i],
                style: const TextStyle(color: Colors.white70),
              ),
            ),
            endChild: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15),
              height: 35,
              child: Text(
                Day2.event[i],
                style: const TextStyle(color: Colors.white70),
              ),
            ))
      }
    ]);
  }
}

class Day2 {
  static List<String> time = [
    '7:00',
    '8:00',
    '9:20',
    '9:50',
    '10:00',
    '11:30',
    '18:00',
  ];
  static List<String> event = [
    '起床・朝の支度・朝食',
    '開発・交流',
    '片付け・クロージング',
    'チェックアウト',
    '移動',
    '解散',
    'レンタカー返却',
  ];
}
