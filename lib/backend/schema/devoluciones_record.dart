import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DevolucionesRecord extends FirestoreRecord {
  DevolucionesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "FechaVenta" field.
  DateTime? _fechaVenta;
  DateTime? get fechaVenta => _fechaVenta;
  bool hasFechaVenta() => _fechaVenta != null;

  // "FechaDevolucion" field.
  DateTime? _fechaDevolucion;
  DateTime? get fechaDevolucion => _fechaDevolucion;
  bool hasFechaDevolucion() => _fechaDevolucion != null;

  // "NumeroOrden" field.
  String? _numeroOrden;
  String get numeroOrden => _numeroOrden ?? '';
  bool hasNumeroOrden() => _numeroOrden != null;

  // "PrecioPagado" field.
  double? _precioPagado;
  double get precioPagado => _precioPagado ?? 0.0;
  bool hasPrecioPagado() => _precioPagado != null;

  // "ProductosComprados" field.
  List<ProductosOrdenesClientesStruct>? _productosComprados;
  List<ProductosOrdenesClientesStruct> get productosComprados =>
      _productosComprados ?? const [];
  bool hasProductosComprados() => _productosComprados != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fechaVenta = snapshotData['FechaVenta'] as DateTime?;
    _fechaDevolucion = snapshotData['FechaDevolucion'] as DateTime?;
    _numeroOrden = snapshotData['NumeroOrden'] as String?;
    _precioPagado = castToType<double>(snapshotData['PrecioPagado']);
    _productosComprados = getStructList(
      snapshotData['ProductosComprados'],
      ProductosOrdenesClientesStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Devoluciones')
          : FirebaseFirestore.instance.collectionGroup('Devoluciones');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Devoluciones').doc(id);

  static Stream<DevolucionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DevolucionesRecord.fromSnapshot(s));

  static Future<DevolucionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DevolucionesRecord.fromSnapshot(s));

  static DevolucionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DevolucionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DevolucionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DevolucionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DevolucionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DevolucionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDevolucionesRecordData({
  DateTime? fechaVenta,
  DateTime? fechaDevolucion,
  String? numeroOrden,
  double? precioPagado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'FechaVenta': fechaVenta,
      'FechaDevolucion': fechaDevolucion,
      'NumeroOrden': numeroOrden,
      'PrecioPagado': precioPagado,
    }.withoutNulls,
  );

  return firestoreData;
}

class DevolucionesRecordDocumentEquality
    implements Equality<DevolucionesRecord> {
  const DevolucionesRecordDocumentEquality();

  @override
  bool equals(DevolucionesRecord? e1, DevolucionesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fechaVenta == e2?.fechaVenta &&
        e1?.fechaDevolucion == e2?.fechaDevolucion &&
        e1?.numeroOrden == e2?.numeroOrden &&
        e1?.precioPagado == e2?.precioPagado &&
        listEquality.equals(e1?.productosComprados, e2?.productosComprados);
  }

  @override
  int hash(DevolucionesRecord? e) => const ListEquality().hash([
        e?.fechaVenta,
        e?.fechaDevolucion,
        e?.numeroOrden,
        e?.precioPagado,
        e?.productosComprados
      ]);

  @override
  bool isValidKey(Object? o) => o is DevolucionesRecord;
}
