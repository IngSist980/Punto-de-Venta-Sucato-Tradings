// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ProductosProveedoresStruct extends FFFirebaseStruct {
  ProductosProveedoresStruct({
    String? nombreProducto,
    int? precioProveedor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nombreProducto = nombreProducto,
        _precioProveedor = precioProveedor,
        super(firestoreUtilData);

  // "NombreProducto" field.
  String? _nombreProducto;
  String get nombreProducto => _nombreProducto ?? '';
  set nombreProducto(String? val) => _nombreProducto = val;

  bool hasNombreProducto() => _nombreProducto != null;

  // "PrecioProveedor" field.
  int? _precioProveedor;
  int get precioProveedor => _precioProveedor ?? 0;
  set precioProveedor(int? val) => _precioProveedor = val;

  void incrementPrecioProveedor(int amount) =>
      precioProveedor = precioProveedor + amount;

  bool hasPrecioProveedor() => _precioProveedor != null;

  static ProductosProveedoresStruct fromMap(Map<String, dynamic> data) =>
      ProductosProveedoresStruct(
        nombreProducto: data['NombreProducto'] as String?,
        precioProveedor: castToType<int>(data['PrecioProveedor']),
      );

  static ProductosProveedoresStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductosProveedoresStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'NombreProducto': _nombreProducto,
        'PrecioProveedor': _precioProveedor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'NombreProducto': serializeParam(
          _nombreProducto,
          ParamType.String,
        ),
        'PrecioProveedor': serializeParam(
          _precioProveedor,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProductosProveedoresStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProductosProveedoresStruct(
        nombreProducto: deserializeParam(
          data['NombreProducto'],
          ParamType.String,
          false,
        ),
        precioProveedor: deserializeParam(
          data['PrecioProveedor'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProductosProveedoresStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductosProveedoresStruct &&
        nombreProducto == other.nombreProducto &&
        precioProveedor == other.precioProveedor;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([nombreProducto, precioProveedor]);
}

ProductosProveedoresStruct createProductosProveedoresStruct({
  String? nombreProducto,
  int? precioProveedor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductosProveedoresStruct(
      nombreProducto: nombreProducto,
      precioProveedor: precioProveedor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductosProveedoresStruct? updateProductosProveedoresStruct(
  ProductosProveedoresStruct? productosProveedores, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productosProveedores
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductosProveedoresStructData(
  Map<String, dynamic> firestoreData,
  ProductosProveedoresStruct? productosProveedores,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productosProveedores == null) {
    return;
  }
  if (productosProveedores.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productosProveedores.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productosProveedoresData =
      getProductosProveedoresFirestoreData(productosProveedores, forFieldValue);
  final nestedData =
      productosProveedoresData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      productosProveedores.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductosProveedoresFirestoreData(
  ProductosProveedoresStruct? productosProveedores, [
  bool forFieldValue = false,
]) {
  if (productosProveedores == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productosProveedores.toMap());

  // Add any Firestore field values
  productosProveedores.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductosProveedoresListFirestoreData(
  List<ProductosProveedoresStruct>? productosProveedoress,
) =>
    productosProveedoress
        ?.map((e) => getProductosProveedoresFirestoreData(e, true))
        .toList() ??
    [];
