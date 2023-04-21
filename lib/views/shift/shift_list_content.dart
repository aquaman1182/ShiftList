import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shift_app/view_models/shift_view_model.dart';
import 'package:table_calendar/table_calendar.dart';

class ShiftPageContent extends StatelessWidget {
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    final shiftViewModel = context.watch<ShiftViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text("シフト表"),
        actions: [
          Builder(
            builder: (innerContext) => IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await shiftViewModel.logout();
                context.go('/');
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TableCalendar(
              locale: 'ja_JP',
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2024, 12, 31),
              focusedDay: shiftViewModel.focusedDay,
              eventLoader: (date) {
                return shiftViewModel.shiftRepository.shiftEvents[date] ?? [];
              },
              onPageChanged: (focusedDay) {
                shiftViewModel.updateFocusedDay(focusedDay);
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {

              },
              calendarBuilders: CalendarBuilders(
                dowBuilder: (_, day) {
                  if(day.weekday == DateTime.sunday) {
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
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              selectedDayPredicate: (day) {
                return isSameDay(shiftViewModel.selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                shiftViewModel.updateSelectedDay(selectedDay);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: shiftViewModel.selectedEvents.length,
              itemBuilder: (context, index) {
                final event = shiftViewModel.selectedEvents[index];
                return Card(
                  child: ListTile(
                    title: Text(event),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}