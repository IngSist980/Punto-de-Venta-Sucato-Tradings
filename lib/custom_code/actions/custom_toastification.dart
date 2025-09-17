// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:toastification/toastification.dart';

Future<void> customToastification(
  BuildContext context,
  String? title,
  String description,
  String toastType,
) async {
  String titulo = title ?? "Notification";

  ToastificationType type;
  switch (toastType.toLowerCase()) {
    case 'info':
      type = ToastificationType.info;
      break;
    case 'warning':
      type = ToastificationType.warning;
      break;
    case 'error':
      type = ToastificationType.error;
      break;
    case 'success':
    default:
      type = ToastificationType.success;
      break;
  }

  ToastificationStyle style = ToastificationStyle.fillColored;
  Alignment alignment = Alignment.topCenter;
  bool applyBlurEffect = true;

  toastification.show(
    context: context,
    type: type,
    style: style,
    title: Text(titulo),
    description: Text(description),
    alignment: alignment,
    autoCloseDuration: const Duration(seconds: 4),
    animationBuilder: (
      context,
      animation,
      alignment,
      child,
    ) {
      return ScaleTransition(
        scale: animation,
        child: child,
      );
    },
    icon: Icon(Icons.notifications),
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
    showProgressBar: true,
    dragToClose: true,
    applyBlurEffect: applyBlurEffect,
  );
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
