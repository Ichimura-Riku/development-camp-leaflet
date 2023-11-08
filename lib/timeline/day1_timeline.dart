import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Day1Timeline extends StatelessWidget {
  const Day1Timeline({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (int i = 0; i < Day1.time.length; i++) ...{
        TimelineTile(
            indicatorStyle: const IndicatorStyle(width: 10, color: Colors.greenAccent),
            beforeLineStyle: const LineStyle(color: Colors.greenAccent),
            alignment: TimelineAlign.manual,
            lineXY: 0.2,
            startChild: Container(
              alignment: Alignment.center,
              height: 35,
              child: Text(
                Day1.time[i],
                style: const TextStyle(color: Colors.white70),
              ),
            ),
            endChild: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15),
              height: 35,
              child: Text(
                Day1.event[i],
                style: const TextStyle(color: Colors.white70),
              ),
            ))
      }
    ]);
  }
}

class Day1 {
  static List<String> time = [
    '9:00',
    '10:00',
    '10:20',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:30',
    '16:00',
    '18:00',
    '19:00',
    '22:00'
  ];
  static List<String> event = [
    'レンタカーのレンタル手続き',
    'オープニング・活動説明',
    'LT発表',
    '買物班行動開始, 開発・交流',
    'お昼休憩',
    '移動準備・集合',
    '移動',
    'チェックイン',
    '夕食班準備開始, 開発・交流',
    '夕食',
    '開発・交流',
    '就寝'
  ];
}
