import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientesRecord extends FirestoreRecord {
  ClientesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "RazonSocial" field.
  String? _razonSocial;
  String get razonSocial => _razonSocial ?? '';
  bool hasRazonSocial() => _razonSocial != null;

  // "CedulaJuridica" field.
  int? _cedulaJuridica;
  int get cedulaJuridica => _cedulaJuridica ?? 0;
  bool hasCedulaJuridica() => _cedulaJuridica != null;

  // "Direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  // "NombreContacto" field.
  String? _nombreContacto;
  String get nombreContacto => _nombreContacto ?? '';
  bool hasNombreContacto() => _nombreContacto != null;

  // "TelefonoContacto" field.
  int? _telefonoContacto;
  int get telefonoContacto => _telefonoContacto ?? 0;
  bool hasTelefonoContacto() => _telefonoContacto != null;

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  void _initializeFields() {
    _razonSocial = snapshotData['RazonSocial'] as String?;
    _cedulaJuridica = castToType<int>(snapshotData['CedulaJuridica']);
    _direccion = snapshotData['Direccion'] as String?;
    _nombreContacto = snapshotData['NombreContacto'] as String?;
    _telefonoContacto = castToType<int>(snapshotData['TelefonoContacto']);
    _categoria = snapshotData['Categoria'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Clientes');

  static Stream<ClientesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientesRecord.fromSnapshot(s));

  static Future<ClientesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClientesRecord.fromSnapshot(s));

  static ClientesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClientesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientesRecordData({
  String? razonSocial,
  int? cedulaJuridica,
  String? direccion,
  String? nombreContacto,
  int? telefonoContacto,
  String? categoria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'RazonSocial': razonSocial,
      'CedulaJuridica': cedulaJuridica,
      'Direccion': direccion,
      'NombreContacto': nombreContacto,
      'TelefonoContacto': telefonoContacto,
      'Categoria': categoria,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClientesRecordDocumentEquality implements Equality<ClientesRecord> {
  const ClientesRecordDocumentEquality();

  @override
  bool equals(ClientesRecord? e1, ClientesRecord? e2) {
    return e1?.razonSocial == e2?.razonSocial &&
        e1?.cedulaJuridica == e2?.cedulaJuridica &&
        e1?.direccion == e2?.direccion &&
        e1?.nombreContacto == e2?.nombreContacto &&
        e1?.telefonoContacto == e2?.telefonoContacto &&
        e1?.categoria == e2?.categoria;
  }

  @override
  int hash(ClientesRecord? e) => const ListEquality().hash([
        e?.razonSocial,
        e?.cedulaJuridica,
        e?.direccion,
        e?.nombreContacto,
        e?.telefonoContacto,
        e?.categoria
      ]);

  @override
  bool isValidKey(Object? o) => o is ClientesRecord;
}
