import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shift_app/view_models/shift_view_model.dart';
import 'package:table_calendar/table_calendar.dart';

class ShiftPage extends StatelessWidget {
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
              onFormatChanged: (format) {},
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