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
  } else if (tipo.toLowerCase() == 'kit') {
    return 'KIT-$code';
  } else if (tipo.toLowerCase() == 'ordenesProveedor') {
    return 'ORD-$code';
  } else if (tipo.toLowerCase() == 'pedidoscarrito') {
    return 'ORDC-$code';
  } else {
    return 'CF-$code';
  }
}

int updateCaducidadValue(DateTime fechaDeCaducidad) {
  final now = DateTime.now();
  final diferencia = fechaDeCaducidad.difference(now);
  final dias = diferencia.inDays;

  if (dias > 10) {
    return 1;
  } else if (dias > 5) {
    return 2;
  } else {
    return 3;
  }
}

int sumaPrecios(List<PaqueteStruct> listaDePaquetes) {
  if (listaDePaquetes == null || listaDePaquetes.isEmpty) {
    return 0;
  }

  int sumaTotal = 0;

  for (var paquete in listaDePaquetes) {
    sumaTotal += paquete.precio * paquete.cantidad;
  }

  return sumaTotal;
}

int sumaCalorias(List<PaqueteStruct> listaDePaquetes) {
  if (listaDePaquetes == null || listaDePaquetes.isEmpty) {
    return 0;
  }

  int sumaTotal = 0;

  for (var paquete in listaDePaquetes) {
    sumaTotal += paquete.calorias;
  }

  return sumaTotal;
}

double iva(
  int totalBruto,
  int impuesto,
  int descuento,
  double credito,
) {
  final double subtotal = (totalBruto - descuento - credito).toDouble();

  final double subtotalSeguro = subtotal < 0 ? 0 : subtotal;

  final double totalConIva = subtotalSeguro * (1 + impuesto / 100.0);

  return double.parse(totalConIva.toStringAsFixed(2));
}

bool cancelarOrden(DateTime fechaEmision) {
  final diferencia = DateTime.now().difference(fechaEmision).inDays;
  return diferencia <= 3;
}
