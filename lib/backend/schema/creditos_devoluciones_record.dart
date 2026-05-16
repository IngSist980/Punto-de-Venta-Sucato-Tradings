import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreditosDevolucionesRecord extends FirestoreRecord {
  CreditosDevolucionesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "FechaEmision" field.
  DateTime? _fechaEmision;
  DateTime? get fechaEmision => _fechaEmision;
  bool hasFechaEmision() => _fechaEmision != null;

  // "NombreCompleto" field.
  String? _nombreCompleto;
  String get nombreCompleto => _nombreCompleto ?? '';
  bool hasNombreCompleto() => _nombreCompleto != null;

  // "refDevolucion" field.
  DocumentReference? _refDevolucion;
  DocumentReference? get refDevolucion => _refDevolucion;
  bool hasRefDevolucion() => _refDevolucion != null;

  // "Estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  // "Credito" field.
  double? _credito;
  double get credito => _credito ?? 0.0;
  bool hasCredito() => _credito != null;

  // "FechaCanjeo" field.
  DateTime? _fechaCanjeo;
  DateTime? get fechaCanjeo => _fechaCanjeo;
  bool hasFechaCanjeo() => _fechaCanjeo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _code = snapshotData['Code'] as String?;
    _fechaEmision = snapshotData['FechaEmision'] as DateTime?;
    _nombreCompleto = snapshotData['NombreCompleto'] as String?;
    _refDevolucion = snapshotData['refDevolucion'] as DocumentReference?;
    _estado = snapshotData['Estado'] as bool?;
    _credito = castToType<double>(snapshotData['Credito']);
    _fechaCanjeo = snapshotData['FechaCanjeo'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('CreditosDevoluciones')
          : FirebaseFirestore.instance.collectionGroup('CreditosDevoluciones');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('CreditosDevoluciones').doc(id);

  static Stream<CreditosDevolucionesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CreditosDevolucionesRecord.fromSnapshot(s));

  static Future<CreditosDevolucionesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CreditosDevolucionesRecord.fromSnapshot(s));

  static CreditosDevolucionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CreditosDevolucionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CreditosDevolucionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CreditosDevolucionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CreditosDevolucionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CreditosDevolucionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCreditosDevolucionesRecordData({
  String? code,
  DateTime? fechaEmision,
  String? nombreCompleto,
  DocumentReference? refDevolucion,
  bool? estado,
  double? credito,
  DateTime? fechaCanjeo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Code': code,
      'FechaEmision': fechaEmision,
      'NombreCompleto': nombreCompleto,
      'refDevolucion': refDevolucion,
      'Estado': estado,
      'Credito': credito,
      'FechaCanjeo': fechaCanjeo,
    }.withoutNulls,
  );

  return firestoreData;
}

class CreditosDevolucionesRecordDocumentEquality
    implements Equality<CreditosDevolucionesRecord> {
  const CreditosDevolucionesRecordDocumentEquality();

  @override
  bool equals(CreditosDevolucionesRecord? e1, CreditosDevolucionesRecord? e2) {
    return e1?.code == e2?.code &&
        e1?.fechaEmision == e2?.fechaEmision &&
        e1?.nombreCompleto == e2?.nombreCompleto &&
        e1?.refDevolucion == e2?.refDevolucion &&
        e1?.estado == e2?.estado &&
        e1?.credito == e2?.credito &&
        e1?.fechaCanjeo == e2?.fechaCanjeo;
  }

  @override
  int hash(CreditosDevolucionesRecord? e) => const ListEquality().hash([
        e?.code,
        e?.fechaEmision,
        e?.nombreCompleto,
        e?.refDevolucion,
        e?.estado,
        e?.credito,
        e?.fechaCanjeo
      ]);

  @override
  bool isValidKey(Object? o) => o is CreditosDevolucionesRecord;
}
