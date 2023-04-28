import 'package:flutter/material.dart';
import 'package:shift_app/models/repositories/shift_repository.dart';

class ShiftViewModel extends ChangeNotifier {
  ShiftViewModel({required this.shiftRepository});

  final ShiftRepository shiftRepository;

  DateTime? _selectedDay;
  List<String> _selectedEvents = [];
  DateTime _focusedDay = DateTime.now();

  DateTime? get selectedDay => _selectedDay;
  List<String> get selectedEvents => _selectedEvents;
  DateTime get focusedDay => _focusedDay;

  Set<DateTime> _selectedDays = <DateTime>{};

  Set<DateTime> get selectedDays => _selectedDays;

  Map<DateTime, TimeOfDay> _startTimes = {};
  Map<DateTime, TimeOfDay> _endTimes = {};

  TimeOfDay? getStartTime(DateTime date) => _startTimes[date];
  TimeOfDay? getEndTime(DateTime date) => _endTimes[date];

  void updateSelectedDays(DateTime selectedDay) {
    if (_selectedDays.contains(selectedDay)) {
      _selectedDays.remove(selectedDay);
    } else {
      _selectedDays.add(selectedDay);
    }
    notifyListeners();
  }

  void clearSelectedDays() {
    _selectedDays.clear();
    notifyListeners();
  }

  void toggleSelectedDay(DateTime day) {
    if (_selectedDays.contains(day)) {
      _selectedDays.remove(day);
    } else {
      _selectedDays.add(day);
    }
    notifyListeners();
  }

  void updateFocusedDay(DateTime day) {
    _focusedDay = day;
    notifyListeners();
  }

  void updateSelectedDay(DateTime? day) {
    _selectedDay = day;
    _selectedEvents = shiftRepository.shiftEvents[day] ?? [];
    notifyListeners();
  }

  void updateStartTime(DateTime date, TimeOfDay time) {
    _startTimes[date] = time;
    notifyListeners();
  }

  void updateEndTime(DateTime date, TimeOfDay time) {
    _endTimes[date] = time;
    notifyListeners();
  }

  void timePicker(
    BuildContext context, 
    DateTime selectedDate, 
    TimeOfDay? startTime, 
    TimeOfDay? endTime
  ) async {
    final TimeOfDay? timePicked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (timePicked != null) {
      updateStartTime(_focusedDay, timePicked);
    }
  }

  Future<void> logout() async {
    await shiftRepository.logout();
  }
}
