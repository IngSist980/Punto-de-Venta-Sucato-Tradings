// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ProductosOrdenesClientesStruct extends FFFirebaseStruct {
  ProductosOrdenesClientesStruct({
    String? nombreProducto,
    int? precio,
    DocumentReference? refProducto,
    int? cantidad,
    int? total,
    DateTime? fechaCompra,
    String? fotoProducto,
    String? sKUProducto,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nombreProducto = nombreProducto,
        _precio = precio,
        _refProducto = refProducto,
        _cantidad = cantidad,
        _total = total,
        _fechaCompra = fechaCompra,
        _fotoProducto = fotoProducto,
        _sKUProducto = sKUProducto,
        super(firestoreUtilData);

  // "NombreProducto" field.
  String? _nombreProducto;
  String get nombreProducto => _nombreProducto ?? '';
  set nombreProducto(String? val) => _nombreProducto = val;

  bool hasNombreProducto() => _nombreProducto != null;

  // "Precio" field.
  int? _precio;
  int get precio => _precio ?? 0;
  set precio(int? val) => _precio = val;

  void incrementPrecio(int amount) => precio = precio + amount;

  bool hasPrecio() => _precio != null;

  // "refProducto" field.
  DocumentReference? _refProducto;
  DocumentReference? get refProducto => _refProducto;
  set refProducto(DocumentReference? val) => _refProducto = val;

  bool hasRefProducto() => _refProducto != null;

  // "Cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  set cantidad(int? val) => _cantidad = val;

  void incrementCantidad(int amount) => cantidad = cantidad + amount;

  bool hasCantidad() => _cantidad != null;

  // "Total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;

  void incrementTotal(int amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "FechaCompra" field.
  DateTime? _fechaCompra;
  DateTime? get fechaCompra => _fechaCompra;
  set fechaCompra(DateTime? val) => _fechaCompra = val;

  bool hasFechaCompra() => _fechaCompra != null;

  // "FotoProducto" field.
  String? _fotoProducto;
  String get fotoProducto => _fotoProducto ?? '';
  set fotoProducto(String? val) => _fotoProducto = val;

  bool hasFotoProducto() => _fotoProducto != null;

  // "SKUProducto" field.
  String? _sKUProducto;
  String get sKUProducto => _sKUProducto ?? '';
  set sKUProducto(String? val) => _sKUProducto = val;

  bool hasSKUProducto() => _sKUProducto != null;

  static ProductosOrdenesClientesStruct fromMap(Map<String, dynamic> data) =>
      ProductosOrdenesClientesStruct(
        nombreProducto: data['NombreProducto'] as String?,
        precio: castToType<int>(data['Precio']),
        refProducto: data['refProducto'] as DocumentReference?,
        cantidad: castToType<int>(data['Cantidad']),
        total: castToType<int>(data['Total']),
        fechaCompra: data['FechaCompra'] as DateTime?,
        fotoProducto: data['FotoProducto'] as String?,
        sKUProducto: data['SKUProducto'] as String?,
      );

  static ProductosOrdenesClientesStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? ProductosOrdenesClientesStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'NombreProducto': _nombreProducto,
        'Precio': _precio,
        'refProducto': _refProducto,
        'Cantidad': _cantidad,
        'Total': _total,
        'FechaCompra': _fechaCompra,
        'FotoProducto': _fotoProducto,
        'SKUProducto': _sKUProducto,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'NombreProducto': serializeParam(
          _nombreProducto,
          ParamType.String,
        ),
        'Precio': serializeParam(
          _precio,
          ParamType.int,
        ),
        'refProducto': serializeParam(
          _refProducto,
          ParamType.DocumentReference,
        ),
        'Cantidad': serializeParam(
          _cantidad,
          ParamType.int,
        ),
        'Total': serializeParam(
          _total,
          ParamType.int,
        ),
        'FechaCompra': serializeParam(
          _fechaCompra,
          ParamType.DateTime,
        ),
        'FotoProducto': serializeParam(
          _fotoProducto,
          ParamType.String,
        ),
        'SKUProducto': serializeParam(
          _sKUProducto,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProductosOrdenesClientesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProductosOrdenesClientesStruct(
        nombreProducto: deserializeParam(
          data['NombreProducto'],
          ParamType.String,
          false,
        ),
        precio: deserializeParam(
          data['Precio'],
          ParamType.int,
          false,
        ),
        refProducto: deserializeParam(
          data['refProducto'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['PuntoDeVenta', 'Productos'],
        ),
        cantidad: deserializeParam(
          data['Cantidad'],
          ParamType.int,
          false,
        ),
        total: deserializeParam(
          data['Total'],
          ParamType.int,
          false,
        ),
        fechaCompra: deserializeParam(
          data['FechaCompra'],
          ParamType.DateTime,
          false,
        ),
        fotoProducto: deserializeParam(
          data['FotoProducto'],
          ParamType.String,
          false,
        ),
        sKUProducto: deserializeParam(
          data['SKUProducto'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProductosOrdenesClientesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductosOrdenesClientesStruct &&
        nombreProducto == other.nombreProducto &&
        precio == other.precio &&
        refProducto == other.refProducto &&
        cantidad == other.cantidad &&
        total == other.total &&
        fechaCompra == other.fechaCompra &&
        fotoProducto == other.fotoProducto &&
        sKUProducto == other.sKUProducto;
  }

  @override
  int get hashCode => const ListEquality().hash([
        nombreProducto,
        precio,
        refProducto,
        cantidad,
        total,
        fechaCompra,
        fotoProducto,
        sKUProducto
      ]);
}

ProductosOrdenesClientesStruct createProductosOrdenesClientesStruct({
  String? nombreProducto,
  int? precio,
  DocumentReference? refProducto,
  int? cantidad,
  int? total,
  DateTime? fechaCompra,
  String? fotoProducto,
  String? sKUProducto,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductosOrdenesClientesStruct(
      nombreProducto: nombreProducto,
      precio: precio,
      refProducto: refProducto,
      cantidad: cantidad,
      total: total,
      fechaCompra: fechaCompra,
      fotoProducto: fotoProducto,
      sKUProducto: sKUProducto,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductosOrdenesClientesStruct? updateProductosOrdenesClientesStruct(
  ProductosOrdenesClientesStruct? productosOrdenesClientes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productosOrdenesClientes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductosOrdenesClientesStructData(
  Map<String, dynamic> firestoreData,
  ProductosOrdenesClientesStruct? productosOrdenesClientes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productosOrdenesClientes == null) {
    return;
  }
  if (productosOrdenesClientes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      productosOrdenesClientes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productosOrdenesClientesData = getProductosOrdenesClientesFirestoreData(
      productosOrdenesClientes, forFieldValue);
  final nestedData =
      productosOrdenesClientesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      productosOrdenesClientes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductosOrdenesClientesFirestoreData(
  ProductosOrdenesClientesStruct? productosOrdenesClientes, [
  bool forFieldValue = false,
]) {
  if (productosOrdenesClientes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productosOrdenesClientes.toMap());

  // Add any Firestore field values
  productosOrdenesClientes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductosOrdenesClientesListFirestoreData(
  List<ProductosOrdenesClientesStruct>? productosOrdenesClientess,
) =>
    productosOrdenesClientess
        ?.map((e) => getProductosOrdenesClientesFirestoreData(e, true))
        .toList() ??
    [];
