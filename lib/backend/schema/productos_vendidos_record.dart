import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductosVendidosRecord extends FirestoreRecord {
  ProductosVendidosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "refProducto" field.
  DocumentReference? _refProducto;
  DocumentReference? get refProducto => _refProducto;
  bool hasRefProducto() => _refProducto != null;

  // "CantidadVendida" field.
  int? _cantidadVendida;
  int get cantidadVendida => _cantidadVendida ?? 0;
  bool hasCantidadVendida() => _cantidadVendida != null;

  // "PrecioNeto" field.
  int? _precioNeto;
  int get precioNeto => _precioNeto ?? 0;
  bool hasPrecioNeto() => _precioNeto != null;

  // "PrecioTotal" field.
  int? _precioTotal;
  int get precioTotal => _precioTotal ?? 0;
  bool hasPrecioTotal() => _precioTotal != null;

  // "IVA" field.
  int? _iva;
  int get iva => _iva ?? 0;
  bool hasIva() => _iva != null;

  // "CompradorName" field.
  String? _compradorName;
  String get compradorName => _compradorName ?? '';
  bool hasCompradorName() => _compradorName != null;

  // "FechaVenta" field.
  DateTime? _fechaVenta;
  DateTime? get fechaVenta => _fechaVenta;
  bool hasFechaVenta() => _fechaVenta != null;

  // "NumeroOrden" field.
  String? _numeroOrden;
  String get numeroOrden => _numeroOrden ?? '';
  bool hasNumeroOrden() => _numeroOrden != null;

  // "Estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _refProducto = snapshotData['refProducto'] as DocumentReference?;
    _cantidadVendida = castToType<int>(snapshotData['CantidadVendida']);
    _precioNeto = castToType<int>(snapshotData['PrecioNeto']);
    _precioTotal = castToType<int>(snapshotData['PrecioTotal']);
    _iva = castToType<int>(snapshotData['IVA']);
    _compradorName = snapshotData['CompradorName'] as String?;
    _fechaVenta = snapshotData['FechaVenta'] as DateTime?;
    _numeroOrden = snapshotData['NumeroOrden'] as String?;
    _estado = snapshotData['Estado'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ProductosVendidos')
          : FirebaseFirestore.instance.collectionGroup('ProductosVendidos');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ProductosVendidos').doc(id);

  static Stream<ProductosVendidosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductosVendidosRecord.fromSnapshot(s));

  static Future<ProductosVendidosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ProductosVendidosRecord.fromSnapshot(s));

  static ProductosVendidosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductosVendidosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductosVendidosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductosVendidosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductosVendidosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductosVendidosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductosVendidosRecordData({
  DocumentReference? refProducto,
  int? cantidadVendida,
  int? precioNeto,
  int? precioTotal,
  int? iva,
  String? compradorName,
  DateTime? fechaVenta,
  String? numeroOrden,
  bool? estado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'refProducto': refProducto,
      'CantidadVendida': cantidadVendida,
      'PrecioNeto': precioNeto,
      'PrecioTotal': precioTotal,
      'IVA': iva,
      'CompradorName': compradorName,
      'FechaVenta': fechaVenta,
      'NumeroOrden': numeroOrden,
      'Estado': estado,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductosVendidosRecordDocumentEquality
    implements Equality<ProductosVendidosRecord> {
  const ProductosVendidosRecordDocumentEquality();

  @override
  bool equals(ProductosVendidosRecord? e1, ProductosVendidosRecord? e2) {
    return e1?.refProducto == e2?.refProducto &&
        e1?.cantidadVendida == e2?.cantidadVendida &&
        e1?.precioNeto == e2?.precioNeto &&
        e1?.precioTotal == e2?.precioTotal &&
        e1?.iva == e2?.iva &&
        e1?.compradorName == e2?.compradorName &&
        e1?.fechaVenta == e2?.fechaVenta &&
        e1?.numeroOrden == e2?.numeroOrden &&
        e1?.estado == e2?.estado;
  }

  @override
  int hash(ProductosVendidosRecord? e) => const ListEquality().hash([
        e?.refProducto,
        e?.cantidadVendida,
        e?.precioNeto,
        e?.precioTotal,
        e?.iva,
        e?.compradorName,
        e?.fechaVenta,
        e?.numeroOrden,
        e?.estado
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductosVendidosRecord;
}
