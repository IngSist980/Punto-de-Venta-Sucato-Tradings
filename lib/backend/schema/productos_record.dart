import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductosRecord extends FirestoreRecord {
  ProductosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "NombreProducto" field.
  String? _nombreProducto;
  String get nombreProducto => _nombreProducto ?? '';
  bool hasNombreProducto() => _nombreProducto != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "Precio" field.
  int? _precio;
  int get precio => _precio ?? 0;
  bool hasPrecio() => _precio != null;

  // "Estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  // "Cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  // "Created_Time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "Imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "SKU" field.
  String? _sku;
  String get sku => _sku ?? '';
  bool hasSku() => _sku != null;

  // "Caducidad" field.
  DateTime? _caducidad;
  DateTime? get caducidad => _caducidad;
  bool hasCaducidad() => _caducidad != null;

  // "Calorias" field.
  int? _calorias;
  int get calorias => _calorias ?? 0;
  bool hasCalorias() => _calorias != null;

  // "ComentarioAjuste" field.
  String? _comentarioAjuste;
  String get comentarioAjuste => _comentarioAjuste ?? '';
  bool hasComentarioAjuste() => _comentarioAjuste != null;

  // "ProveedorRef" field.
  DocumentReference? _proveedorRef;
  DocumentReference? get proveedorRef => _proveedorRef;
  bool hasProveedorRef() => _proveedorRef != null;

  // "ProveedorName" field.
  String? _proveedorName;
  String get proveedorName => _proveedorName ?? '';
  bool hasProveedorName() => _proveedorName != null;

  // "CaducidadValue" field.
  int? _caducidadValue;
  int get caducidadValue => _caducidadValue ?? 0;
  bool hasCaducidadValue() => _caducidadValue != null;

  // "CantidadVendidas" field.
  int? _cantidadVendidas;
  int get cantidadVendidas => _cantidadVendidas ?? 0;
  bool hasCantidadVendidas() => _cantidadVendidas != null;

  // "Lote" field.
  String? _lote;
  String get lote => _lote ?? '';
  bool hasLote() => _lote != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nombreProducto = snapshotData['NombreProducto'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _categoria = snapshotData['Categoria'] as String?;
    _precio = castToType<int>(snapshotData['Precio']);
    _estado = snapshotData['Estado'] as bool?;
    _cantidad = castToType<int>(snapshotData['Cantidad']);
    _createdTime = snapshotData['Created_Time'] as DateTime?;
    _imagen = snapshotData['Imagen'] as String?;
    _sku = snapshotData['SKU'] as String?;
    _caducidad = snapshotData['Caducidad'] as DateTime?;
    _calorias = castToType<int>(snapshotData['Calorias']);
    _comentarioAjuste = snapshotData['ComentarioAjuste'] as String?;
    _proveedorRef = snapshotData['ProveedorRef'] as DocumentReference?;
    _proveedorName = snapshotData['ProveedorName'] as String?;
    _caducidadValue = castToType<int>(snapshotData['CaducidadValue']);
    _cantidadVendidas = castToType<int>(snapshotData['CantidadVendidas']);
    _lote = snapshotData['Lote'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Productos')
          : FirebaseFirestore.instance.collectionGroup('Productos');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Productos').doc(id);

  static Stream<ProductosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductosRecord.fromSnapshot(s));

  static Future<ProductosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductosRecord.fromSnapshot(s));

  static ProductosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductosRecordData({
  String? nombreProducto,
  String? descripcion,
  String? categoria,
  int? precio,
  bool? estado,
  int? cantidad,
  DateTime? createdTime,
  String? imagen,
  String? sku,
  DateTime? caducidad,
  int? calorias,
  String? comentarioAjuste,
  DocumentReference? proveedorRef,
  String? proveedorName,
  int? caducidadValue,
  int? cantidadVendidas,
  String? lote,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NombreProducto': nombreProducto,
      'Descripcion': descripcion,
      'Categoria': categoria,
      'Precio': precio,
      'Estado': estado,
      'Cantidad': cantidad,
      'Created_Time': createdTime,
      'Imagen': imagen,
      'SKU': sku,
      'Caducidad': caducidad,
      'Calorias': calorias,
      'ComentarioAjuste': comentarioAjuste,
      'ProveedorRef': proveedorRef,
      'ProveedorName': proveedorName,
      'CaducidadValue': caducidadValue,
      'CantidadVendidas': cantidadVendidas,
      'Lote': lote,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductosRecordDocumentEquality implements Equality<ProductosRecord> {
  const ProductosRecordDocumentEquality();

  @override
  bool equals(ProductosRecord? e1, ProductosRecord? e2) {
    return e1?.nombreProducto == e2?.nombreProducto &&
        e1?.descripcion == e2?.descripcion &&
        e1?.categoria == e2?.categoria &&
        e1?.precio == e2?.precio &&
        e1?.estado == e2?.estado &&
        e1?.cantidad == e2?.cantidad &&
        e1?.createdTime == e2?.createdTime &&
        e1?.imagen == e2?.imagen &&
        e1?.sku == e2?.sku &&
        e1?.caducidad == e2?.caducidad &&
        e1?.calorias == e2?.calorias &&
        e1?.comentarioAjuste == e2?.comentarioAjuste &&
        e1?.proveedorRef == e2?.proveedorRef &&
        e1?.proveedorName == e2?.proveedorName &&
        e1?.caducidadValue == e2?.caducidadValue &&
        e1?.cantidadVendidas == e2?.cantidadVendidas &&
        e1?.lote == e2?.lote;
  }

  @override
  int hash(ProductosRecord? e) => const ListEquality().hash([
        e?.nombreProducto,
        e?.descripcion,
        e?.categoria,
        e?.precio,
        e?.estado,
        e?.cantidad,
        e?.createdTime,
        e?.imagen,
        e?.sku,
        e?.caducidad,
        e?.calorias,
        e?.comentarioAjuste,
        e?.proveedorRef,
        e?.proveedorName,
        e?.caducidadValue,
        e?.cantidadVendidas,
        e?.lote
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductosRecord;
}
