import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class Day1Timeline extends StatelessWidget {
  const Day1Timeline({super.key});
  @override
  Widget build(BuildContext context) {
    return FixedTimeline.tileBuilder(
      builder: TimelineTileBuilder.connectedFromStyle(
        contentsAlign: ContentsAlign.basic,
        oppositeContentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(Day1.time[index]),
        ),
        contentsBuilder: (context, index) => Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(Day1.event[index]),
          ),
        ),
        connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
        indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
        itemCount: Day1.time.length,
      ),
    );
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
    '買い物班行動開始, 開発',
    'お昼休憩',
    '移動準備・集合',
    '移動',
    'チェックイン',
    '夕食班準備開始・開発',
    '夕食',
    '開発',
    '就寝'
  ];
}
