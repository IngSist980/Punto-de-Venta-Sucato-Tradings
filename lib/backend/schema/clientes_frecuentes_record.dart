import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientesFrecuentesRecord extends FirestoreRecord {
  ClientesFrecuentesRecord._(
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
  String? _cedulaJuridica;
  String get cedulaJuridica => _cedulaJuridica ?? '';
  bool hasCedulaJuridica() => _cedulaJuridica != null;

  // "Telefono" field.
  String? _telefono;
  String get telefono => _telefono ?? '';
  bool hasTelefono() => _telefono != null;

  // "UsuarioRef" field.
  DocumentReference? _usuarioRef;
  DocumentReference? get usuarioRef => _usuarioRef;
  bool hasUsuarioRef() => _usuarioRef != null;

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "Direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  // "NombreCompleto" field.
  String? _nombreCompleto;
  String get nombreCompleto => _nombreCompleto ?? '';
  bool hasNombreCompleto() => _nombreCompleto != null;

  // "Codigo" field.
  String? _codigo;
  String get codigo => _codigo ?? '';
  bool hasCodigo() => _codigo != null;

  // "FechaEdicion" field.
  DateTime? _fechaEdicion;
  DateTime? get fechaEdicion => _fechaEdicion;
  bool hasFechaEdicion() => _fechaEdicion != null;

  // "Log" field.
  List<LogEdicionClientesStruct>? _log;
  List<LogEdicionClientesStruct> get log => _log ?? const [];
  bool hasLog() => _log != null;

  // "Telefono2" field.
  String? _telefono2;
  String get telefono2 => _telefono2 ?? '';
  bool hasTelefono2() => _telefono2 != null;

  // "CantidaOrdenes" field.
  int? _cantidaOrdenes;
  int get cantidaOrdenes => _cantidaOrdenes ?? 0;
  bool hasCantidaOrdenes() => _cantidaOrdenes != null;

  // "estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  void _initializeFields() {
    _razonSocial = snapshotData['RazonSocial'] as String?;
    _cedulaJuridica = snapshotData['CedulaJuridica'] as String?;
    _telefono = snapshotData['Telefono'] as String?;
    _usuarioRef = snapshotData['UsuarioRef'] as DocumentReference?;
    _categoria = snapshotData['Categoria'] as String?;
    _direccion = snapshotData['Direccion'] as String?;
    _nombreCompleto = snapshotData['NombreCompleto'] as String?;
    _codigo = snapshotData['Codigo'] as String?;
    _fechaEdicion = snapshotData['FechaEdicion'] as DateTime?;
    _log = getStructList(
      snapshotData['Log'],
      LogEdicionClientesStruct.fromMap,
    );
    _telefono2 = snapshotData['Telefono2'] as String?;
    _cantidaOrdenes = castToType<int>(snapshotData['CantidaOrdenes']);
    _estado = snapshotData['estado'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ClientesFrecuentes');

  static Stream<ClientesFrecuentesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientesFrecuentesRecord.fromSnapshot(s));

  static Future<ClientesFrecuentesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ClientesFrecuentesRecord.fromSnapshot(s));

  static ClientesFrecuentesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClientesFrecuentesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientesFrecuentesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientesFrecuentesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientesFrecuentesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientesFrecuentesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientesFrecuentesRecordData({
  String? razonSocial,
  String? cedulaJuridica,
  String? telefono,
  DocumentReference? usuarioRef,
  String? categoria,
  String? direccion,
  String? nombreCompleto,
  String? codigo,
  DateTime? fechaEdicion,
  String? telefono2,
  int? cantidaOrdenes,
  bool? estado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'RazonSocial': razonSocial,
      'CedulaJuridica': cedulaJuridica,
      'Telefono': telefono,
      'UsuarioRef': usuarioRef,
      'Categoria': categoria,
      'Direccion': direccion,
      'NombreCompleto': nombreCompleto,
      'Codigo': codigo,
      'FechaEdicion': fechaEdicion,
      'Telefono2': telefono2,
      'CantidaOrdenes': cantidaOrdenes,
      'estado': estado,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClientesFrecuentesRecordDocumentEquality
    implements Equality<ClientesFrecuentesRecord> {
  const ClientesFrecuentesRecordDocumentEquality();

  @override
  bool equals(ClientesFrecuentesRecord? e1, ClientesFrecuentesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.razonSocial == e2?.razonSocial &&
        e1?.cedulaJuridica == e2?.cedulaJuridica &&
        e1?.telefono == e2?.telefono &&
        e1?.usuarioRef == e2?.usuarioRef &&
        e1?.categoria == e2?.categoria &&
        e1?.direccion == e2?.direccion &&
        e1?.nombreCompleto == e2?.nombreCompleto &&
        e1?.codigo == e2?.codigo &&
        e1?.fechaEdicion == e2?.fechaEdicion &&
        listEquality.equals(e1?.log, e2?.log) &&
        e1?.telefono2 == e2?.telefono2 &&
        e1?.cantidaOrdenes == e2?.cantidaOrdenes &&
        e1?.estado == e2?.estado;
  }

  @override
  int hash(ClientesFrecuentesRecord? e) => const ListEquality().hash([
        e?.razonSocial,
        e?.cedulaJuridica,
        e?.telefono,
        e?.usuarioRef,
        e?.categoria,
        e?.direccion,
        e?.nombreCompleto,
        e?.codigo,
        e?.fechaEdicion,
        e?.log,
        e?.telefono2,
        e?.cantidaOrdenes,
        e?.estado
      ]);

  @override
  bool isValidKey(Object? o) => o is ClientesFrecuentesRecord;
}
