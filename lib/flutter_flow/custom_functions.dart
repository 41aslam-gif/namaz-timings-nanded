import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

dynamic getNamazByDate(
  String? todaysDate,
  dynamic times,
) {
  if (times == null || todaysDate == null) return {};

  // Access months map
  final months = times['months'];
  if (months == null) return {};

  // Loop through all months
  for (var month in months.values) {
    if (month is List) {
      for (var item in month) {
        if (item['date'] == todaysDate) {
          return item; // ✅ Found today's data
        }
      }
    }
  }

  return {}; // ❌ If not found
}

String add20Minutes(String timeStr) {
  final parts = timeStr.split(':');
  int hour = int.parse(parts[0]);
  int minute = int.parse(parts[1]);

  DateTime dt = DateTime(2024, 1, 1, hour, minute).add(Duration(minutes: 20));

  return "${dt.hour}:${dt.minute.toString().padLeft(2, '0')}";
}

String getDayFromDate(String dateString) {
  if (dateString.isEmpty) return "";

  List<String> parts = dateString.split('/');
  return parts.isNotEmpty ? parts[0] : "";
}
