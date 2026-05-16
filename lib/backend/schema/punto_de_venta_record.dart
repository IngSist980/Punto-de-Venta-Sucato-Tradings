import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PuntoDeVentaRecord extends FirestoreRecord {
  PuntoDeVentaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Ubicacion" field.
  String? _ubicacion;
  String get ubicacion => _ubicacion ?? '';
  bool hasUbicacion() => _ubicacion != null;

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  void _initializeFields() {
    _ubicacion = snapshotData['Ubicacion'] as String?;
    _nombre = snapshotData['Nombre'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PuntoDeVenta');

  static Stream<PuntoDeVentaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PuntoDeVentaRecord.fromSnapshot(s));

  static Future<PuntoDeVentaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PuntoDeVentaRecord.fromSnapshot(s));

  static PuntoDeVentaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PuntoDeVentaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PuntoDeVentaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PuntoDeVentaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PuntoDeVentaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PuntoDeVentaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPuntoDeVentaRecordData({
  String? ubicacion,
  String? nombre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Ubicacion': ubicacion,
      'Nombre': nombre,
    }.withoutNulls,
  );

  return firestoreData;
}

class PuntoDeVentaRecordDocumentEquality
    implements Equality<PuntoDeVentaRecord> {
  const PuntoDeVentaRecordDocumentEquality();

  @override
  bool equals(PuntoDeVentaRecord? e1, PuntoDeVentaRecord? e2) {
    return e1?.ubicacion == e2?.ubicacion && e1?.nombre == e2?.nombre;
  }

  @override
  int hash(PuntoDeVentaRecord? e) =>
      const ListEquality().hash([e?.ubicacion, e?.nombre]);

  @override
  bool isValidKey(Object? o) => o is PuntoDeVentaRecord;
}
