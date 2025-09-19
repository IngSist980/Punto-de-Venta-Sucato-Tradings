import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriasRecord extends FirestoreRecord {
  CategoriasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _categoria = snapshotData['Categoria'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Categorias')
          : FirebaseFirestore.instance.collectionGroup('Categorias');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Categorias').doc(id);

  static Stream<CategoriasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriasRecord.fromSnapshot(s));

  static Future<CategoriasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriasRecord.fromSnapshot(s));

  static CategoriasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriasRecordData({
  String? categoria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Categoria': categoria,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriasRecordDocumentEquality implements Equality<CategoriasRecord> {
  const CategoriasRecordDocumentEquality();

  @override
  bool equals(CategoriasRecord? e1, CategoriasRecord? e2) {
    return e1?.categoria == e2?.categoria;
  }

  @override
  int hash(CategoriasRecord? e) => const ListEquality().hash([e?.categoria]);

  @override
  bool isValidKey(Object? o) => o is CategoriasRecord;
}
