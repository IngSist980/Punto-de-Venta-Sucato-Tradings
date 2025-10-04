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

  // "Correo" field.
  String? _correo;
  String get correo => _correo ?? '';
  bool hasCorreo() => _correo != null;

  // "Encargado" field.
  String? _encargado;
  String get encargado => _encargado ?? '';
  bool hasEncargado() => _encargado != null;

  // "Telefono" field.
  String? _telefono;
  String get telefono => _telefono ?? '';
  bool hasTelefono() => _telefono != null;

  // "PlazoDeReparto" field.
  String? _plazoDeReparto;
  String get plazoDeReparto => _plazoDeReparto ?? '';
  bool hasPlazoDeReparto() => _plazoDeReparto != null;

  // "CantDiasRepart" field.
  int? _cantDiasRepart;
  int get cantDiasRepart => _cantDiasRepart ?? 0;
  bool hasCantDiasRepart() => _cantDiasRepart != null;

  // "Productos" field.
  List<ProductosProveedoresStruct>? _productos;
  List<ProductosProveedoresStruct> get productos => _productos ?? const [];
  bool hasProductos() => _productos != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nombreProveedor = snapshotData['NombreProveedor'] as String?;
    _estado = snapshotData['Estado'] as bool?;
    _fechaCreacion = snapshotData['FechaCreacion'] as DateTime?;
    _correo = snapshotData['Correo'] as String?;
    _encargado = snapshotData['Encargado'] as String?;
    _telefono = snapshotData['Telefono'] as String?;
    _plazoDeReparto = snapshotData['PlazoDeReparto'] as String?;
    _cantDiasRepart = castToType<int>(snapshotData['CantDiasRepart']);
    _productos = getStructList(
      snapshotData['Productos'],
      ProductosProveedoresStruct.fromMap,
    );
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
  String? correo,
  String? encargado,
  String? telefono,
  String? plazoDeReparto,
  int? cantDiasRepart,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NombreProveedor': nombreProveedor,
      'Estado': estado,
      'FechaCreacion': fechaCreacion,
      'Correo': correo,
      'Encargado': encargado,
      'Telefono': telefono,
      'PlazoDeReparto': plazoDeReparto,
      'CantDiasRepart': cantDiasRepart,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProveedoresRecordDocumentEquality implements Equality<ProveedoresRecord> {
  const ProveedoresRecordDocumentEquality();

  @override
  bool equals(ProveedoresRecord? e1, ProveedoresRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nombreProveedor == e2?.nombreProveedor &&
        e1?.estado == e2?.estado &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.correo == e2?.correo &&
        e1?.encargado == e2?.encargado &&
        e1?.telefono == e2?.telefono &&
        e1?.plazoDeReparto == e2?.plazoDeReparto &&
        e1?.cantDiasRepart == e2?.cantDiasRepart &&
        listEquality.equals(e1?.productos, e2?.productos);
  }

  @override
  int hash(ProveedoresRecord? e) => const ListEquality().hash([
        e?.nombreProveedor,
        e?.estado,
        e?.fechaCreacion,
        e?.correo,
        e?.encargado,
        e?.telefono,
        e?.plazoDeReparto,
        e?.cantDiasRepart,
        e?.productos
      ]);

  @override
  bool isValidKey(Object? o) => o is ProveedoresRecord;
}
