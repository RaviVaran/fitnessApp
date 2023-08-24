import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<SetStruct>? createSet() {
  SetStruct set1 = SetStruct(reps: 10, weight: 145, number: 1);
  return [set1];
}

List<String> getLabels() {
  return ["mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
}

List<int> getFrequency(List<DateTime> workout) {
  List<int> frequency = List<int>.filled(7, 0);
  for (var workout in workout) {
    int dayofweek = workout.weekday;
    frequency[dayofweek - 1]++;
  }
  return frequency;
}

String formatDuration(int milllisecond) {
  Duration duration = Duration(milliseconds: milllisecond);
  int twoDigitMinutes = duration.inMinutes.remainder(60);
  int twoDigitSeconds = duration.inSeconds.remainder(60);
  String twoDigitMinutesStr = twoDigitMinutes.toString().padLeft(2, '0');
  String twoDigitSecondsStr = twoDigitSeconds.toString().padLeft(2, '0');
  return "$twoDigitMinutesStr:$twoDigitSecondsStr";
}
