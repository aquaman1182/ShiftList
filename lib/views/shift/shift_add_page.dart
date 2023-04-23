import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shift_app/view_models/shift_view_model.dart';
import 'package:table_calendar/table_calendar.dart';

class ShiftAddPage extends StatefulWidget {
  @override
  _ShiftAddPageState createState() => _ShiftAddPageState();
}

class _ShiftAddPageState extends State<ShiftAddPage> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  final Set<DateTime> _selectedDays = <DateTime>{};

  DateTime _nextMonthFirstDay() {
    DateTime now = DateTime.now();
    DateTime firstDayOfNextMonth =
        DateTime(now.year, now.month + 1, 1);
    return firstDayOfNextMonth;
  }

  @override
  Widget build(BuildContext context) {
    final ShiftViewModel shiftViewModel = context.watch();

    return Scaffold(
      appBar: AppBar(
        title: Text("Shift追加"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TableCalendar(
              locale: 'ja_JP',
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2024, 12, 31),
              focusedDay: _nextMonthFirstDay(),
              eventLoader: (date) {
                return shiftViewModel.shiftRepository.shiftEvents[date] ?? [];
              },
              onPageChanged: (focusedDay) {
                shiftViewModel.updateFocusedDay(focusedDay);
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                //TODO カレンダーの表示形式を変えたときの処理
              },
              calendarBuilders: CalendarBuilders(
                dowBuilder: (_, day) {
                  if (day.weekday == DateTime.sunday) {
                    return Center(
                      child: Text(
                        "日",
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return null;
                },
                selectedBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                todayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              selectedDayPredicate: (day) => _selectedDays.contains(day),
              onDaySelected: (selectedDay, focusedDay) {
                shiftViewModel.updateFocusedDay(focusedDay);
                shiftViewModel.updateSelectedDays(selectedDay);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.go("/shift/add/setting",extra: {'selectedDays': shiftViewModel.selectedDays},);
            }, 
            child: const Text('選択'),
          )
        ],
      ),
    );
  }
}
