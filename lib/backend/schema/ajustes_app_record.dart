import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AjustesAppRecord extends FirestoreRecord {
  AjustesAppRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "AdminAccess" field.
  String? _adminAccess;
  String get adminAccess => _adminAccess ?? '';
  bool hasAdminAccess() => _adminAccess != null;

  // "CajaAbierta" field.
  bool? _cajaAbierta;
  bool get cajaAbierta => _cajaAbierta ?? false;
  bool hasCajaAbierta() => _cajaAbierta != null;

  void _initializeFields() {
    _adminAccess = snapshotData['AdminAccess'] as String?;
    _cajaAbierta = snapshotData['CajaAbierta'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AjustesApp');

  static Stream<AjustesAppRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AjustesAppRecord.fromSnapshot(s));

  static Future<AjustesAppRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AjustesAppRecord.fromSnapshot(s));

  static AjustesAppRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AjustesAppRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AjustesAppRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AjustesAppRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AjustesAppRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AjustesAppRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAjustesAppRecordData({
  String? adminAccess,
  bool? cajaAbierta,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'AdminAccess': adminAccess,
      'CajaAbierta': cajaAbierta,
    }.withoutNulls,
  );

  return firestoreData;
}

class AjustesAppRecordDocumentEquality implements Equality<AjustesAppRecord> {
  const AjustesAppRecordDocumentEquality();

  @override
  bool equals(AjustesAppRecord? e1, AjustesAppRecord? e2) {
    return e1?.adminAccess == e2?.adminAccess &&
        e1?.cajaAbierta == e2?.cajaAbierta;
  }

  @override
  int hash(AjustesAppRecord? e) =>
      const ListEquality().hash([e?.adminAccess, e?.cajaAbierta]);

  @override
  bool isValidKey(Object? o) => o is AjustesAppRecord;
}
