import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsuariosRecord extends FirestoreRecord {
  UsuariosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "NombreCompleto" field.
  String? _nombreCompleto;
  String get nombreCompleto => _nombreCompleto ?? '';
  bool hasNombreCompleto() => _nombreCompleto != null;

  // "CorreoElectronico" field.
  String? _correoElectronico;
  String get correoElectronico => _correoElectronico ?? '';
  bool hasCorreoElectronico() => _correoElectronico != null;

  // "Telefono" field.
  int? _telefono;
  int get telefono => _telefono ?? 0;
  bool hasTelefono() => _telefono != null;

  // "NombreUsuario" field.
  String? _nombreUsuario;
  String get nombreUsuario => _nombreUsuario ?? '';
  bool hasNombreUsuario() => _nombreUsuario != null;

  // "Contrasena" field.
  String? _contrasena;
  String get contrasena => _contrasena ?? '';
  bool hasContrasena() => _contrasena != null;

  void _initializeFields() {
    _nombreCompleto = snapshotData['NombreCompleto'] as String?;
    _correoElectronico = snapshotData['CorreoElectronico'] as String?;
    _telefono = castToType<int>(snapshotData['Telefono']);
    _nombreUsuario = snapshotData['NombreUsuario'] as String?;
    _contrasena = snapshotData['Contrasena'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Usuarios');

  static Stream<UsuariosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsuariosRecord.fromSnapshot(s));

  static Future<UsuariosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsuariosRecord.fromSnapshot(s));

  static UsuariosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsuariosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsuariosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsuariosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsuariosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsuariosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsuariosRecordData({
  String? nombreCompleto,
  String? correoElectronico,
  int? telefono,
  String? nombreUsuario,
  String? contrasena,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NombreCompleto': nombreCompleto,
      'CorreoElectronico': correoElectronico,
      'Telefono': telefono,
      'NombreUsuario': nombreUsuario,
      'Contrasena': contrasena,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsuariosRecordDocumentEquality implements Equality<UsuariosRecord> {
  const UsuariosRecordDocumentEquality();

  @override
  bool equals(UsuariosRecord? e1, UsuariosRecord? e2) {
    return e1?.nombreCompleto == e2?.nombreCompleto &&
        e1?.correoElectronico == e2?.correoElectronico &&
        e1?.telefono == e2?.telefono &&
        e1?.nombreUsuario == e2?.nombreUsuario &&
        e1?.contrasena == e2?.contrasena;
  }

  @override
  int hash(UsuariosRecord? e) => const ListEquality().hash([
        e?.nombreCompleto,
        e?.correoElectronico,
        e?.telefono,
        e?.nombreUsuario,
        e?.contrasena
      ]);

  @override
  bool isValidKey(Object? o) => o is UsuariosRecord;
}
