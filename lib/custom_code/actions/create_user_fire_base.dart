// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future createUserFireBase(
  String email,
  String displayName,
  String photo,
  String phoneNumber,
  String rol,
  String password,
  Future Function() accionAlTerminar,
) async {
  try {
    // Crear usuario en Firebase Auth
    final auth = FirebaseAuth.instance;
    final cred = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = cred.user;
    if (user == null) {
      throw Exception("No se pudo crear el usuario.");
    }

    // Actualizar perfil básico de Firebase Auth
    await user.updateDisplayName(displayName);
    if (photo.isNotEmpty) {
      await user.updatePhotoURL(photo);
    }

    // Guardar información adicional en Firestore
    final firestore = FirebaseFirestore.instance;
    await firestore.collection('user').doc(user.uid).set({
      'email': email,
      'display_name': displayName,
      'photo_url': photo,
      'uid': user.uid,
      'created_time': FieldValue.serverTimestamp(),
      'phone_number': phoneNumber,
      'rol': rol,
    });

    // Ejecutar acción extra después de terminar
    if (accionAlTerminar != null) {
      await accionAlTerminar();
    }
  } on FirebaseAuthException catch (e) {
    print("Error en Firebase Auth: ${e.message}");
    rethrow;
  } catch (e) {
    print("Error general: $e");
    rethrow;
  }
}
