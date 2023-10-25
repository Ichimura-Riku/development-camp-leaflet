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
        body: Stack(children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'KITCAMP2023 Timeline',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.tealAccent[100]),
                  ),
                ),
                CalendarTimeline(
                  showYears: false,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2023, 11, 11),
                  lastDate: DateTime(2023, 11, 12),
                  onDateSelected: (date) =>
                      setState(() => _selectedDate = date),
                  leftMargin: 20,
                  monthColor: Colors.white70,
                  dayColor: Colors.teal[200],
                  dayNameColor: const Color(0xFF333A47),
                  activeDayColor: Colors.white,
                  activeBackgroundDayColor: Colors.redAccent[100],
                  dotsColor: const Color(0xFF333A47),
                  selectableDayPredicate: (date) => date.day != 23,
                  locale: 'en',
                ),
                const Expanded(child: Timeline()),
              ],
            ),
          ),
        ]));
  }
}
