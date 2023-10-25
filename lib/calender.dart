import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:kitcamp2023/timeline.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime(2023, 11, 11);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF333A47),
        appBar: AppBar(
          backgroundColor: const Color(0xFF333A47),
          elevation: 0,
          title: Text(
            'KITCAMP2023 Timeline',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.tealAccent[100]),
          ),
        ),
        body: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CalendarTimeline(
                showYears: false,
                initialDate: _selectedDate,
                firstDate: DateTime(2023, 11, 11),
                lastDate: DateTime(2023, 11, 12),
                onDateSelected: (date) => setState(() => _selectedDate = date),
                leftMargin: 15,
                monthColor: Colors.white70,
                dayColor: Colors.teal[200],
                dayNameColor: const Color(0xFF333A47),
                activeDayColor: Colors.white70,
                activeBackgroundDayColor: Colors.redAccent[100],
                dotsColor: const Color(0xFF333A47),
                selectableDayPredicate: (date) => date.day != 23,
                locale: 'ja',
              ),
              Expanded(child: Timeline(date: _selectedDate)),
            ],
          ),
        ]));
  }
}
