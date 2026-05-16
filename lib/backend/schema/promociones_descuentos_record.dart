import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromocionesDescuentosRecord extends FirestoreRecord {
  PromocionesDescuentosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "descuento" field.
  int? _descuento;
  int get descuento => _descuento ?? 0;
  bool hasDescuento() => _descuento != null;

  // "UnSoloUso" field.
  bool? _unSoloUso;
  bool get unSoloUso => _unSoloUso ?? false;
  bool hasUnSoloUso() => _unSoloUso != null;

  void _initializeFields() {
    _code = snapshotData['Code'] as String?;
    _descuento = castToType<int>(snapshotData['descuento']);
    _unSoloUso = snapshotData['UnSoloUso'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PromocionesDescuentos');

  static Stream<PromocionesDescuentosRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => PromocionesDescuentosRecord.fromSnapshot(s));

  static Future<PromocionesDescuentosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PromocionesDescuentosRecord.fromSnapshot(s));

  static PromocionesDescuentosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromocionesDescuentosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromocionesDescuentosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromocionesDescuentosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromocionesDescuentosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromocionesDescuentosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromocionesDescuentosRecordData({
  String? code,
  int? descuento,
  bool? unSoloUso,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Code': code,
      'descuento': descuento,
      'UnSoloUso': unSoloUso,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromocionesDescuentosRecordDocumentEquality
    implements Equality<PromocionesDescuentosRecord> {
  const PromocionesDescuentosRecordDocumentEquality();

  @override
  bool equals(
      PromocionesDescuentosRecord? e1, PromocionesDescuentosRecord? e2) {
    return e1?.code == e2?.code &&
        e1?.descuento == e2?.descuento &&
        e1?.unSoloUso == e2?.unSoloUso;
  }

  @override
  int hash(PromocionesDescuentosRecord? e) =>
      const ListEquality().hash([e?.code, e?.descuento, e?.unSoloUso]);

  @override
  bool isValidKey(Object? o) => o is PromocionesDescuentosRecord;
}
