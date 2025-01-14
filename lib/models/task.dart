import 'package:flutter/material.dart';

class Task {
  final String title;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String description;
  final String category;

  Task({
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.category,
  });
}
