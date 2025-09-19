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

bool showSearchResult(
  String textSearchfor,
  String textSearchIn,
) {
  return textSearchIn.toLowerCase().contains(textSearchfor.toLowerCase());
}

String uniqueID(String tipo) {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final rand = math.Random();
  final code =
      List.generate(6, (_) => chars[rand.nextInt(chars.length)]).join();

  if (tipo.toLowerCase() == 'empleado') {
    return 'EMP-$code';
  } else if (tipo.toLowerCase() == 'sku') {
    return 'SKU-$code';
  } else if (tipo.toLowerCase() == 'cliente') {
    return 'CLI-$code';
  } else {
    // Por defecto usa CF-
    return 'CF-$code';
  }
}
