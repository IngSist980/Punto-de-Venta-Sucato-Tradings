import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProveedoresRecord extends FirestoreRecord {
  ProveedoresRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "NombreProveedor" field.
  String? _nombreProveedor;
  String get nombreProveedor => _nombreProveedor ?? '';
  bool hasNombreProveedor() => _nombreProveedor != null;

  // "Estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  // "FechaCreacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nombreProveedor = snapshotData['NombreProveedor'] as String?;
    _estado = snapshotData['Estado'] as bool?;
    _fechaCreacion = snapshotData['FechaCreacion'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Proveedores')
          : FirebaseFirestore.instance.collectionGroup('Proveedores');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Proveedores').doc(id);

  static Stream<ProveedoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProveedoresRecord.fromSnapshot(s));

  static Future<ProveedoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProveedoresRecord.fromSnapshot(s));

  static ProveedoresRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProveedoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProveedoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProveedoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProveedoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProveedoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProveedoresRecordData({
  String? nombreProveedor,
  bool? estado,
  DateTime? fechaCreacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NombreProveedor': nombreProveedor,
      'Estado': estado,
      'FechaCreacion': fechaCreacion,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProveedoresRecordDocumentEquality implements Equality<ProveedoresRecord> {
  const ProveedoresRecordDocumentEquality();

  @override
  bool equals(ProveedoresRecord? e1, ProveedoresRecord? e2) {
    return e1?.nombreProveedor == e2?.nombreProveedor &&
        e1?.estado == e2?.estado &&
        e1?.fechaCreacion == e2?.fechaCreacion;
  }

  @override
  int hash(ProveedoresRecord? e) => const ListEquality()
      .hash([e?.nombreProveedor, e?.estado, e?.fechaCreacion]);

  @override
  bool isValidKey(Object? o) => o is ProveedoresRecord;
}
