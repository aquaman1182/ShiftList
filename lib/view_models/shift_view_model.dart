import 'package:flutter/material.dart';
import 'package:shift_app/models/repositories/shift_repository.dart';

class ShiftViewModel extends ChangeNotifier {
  ShiftViewModel({required this.shiftRepository}) {
    _fetchShiftEvents();
  }

  final ShiftRepository shiftRepository;
  Map<DateTime, List<String>> _shiftEvents = {};

  Map<DateTime, List<String>> get shiftEvents => _shiftEvents;

  Future<void> _fetchShiftEvents() async {
    _shiftEvents = await shiftRepository.getShiftEvents();
    notifyListeners();
  }
}