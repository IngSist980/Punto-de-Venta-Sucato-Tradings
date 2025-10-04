// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PedidosProveedorStruct extends FFFirebaseStruct {
  PedidosProveedorStruct({
    String? producto,
    int? cantidad,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _producto = producto,
        _cantidad = cantidad,
        super(firestoreUtilData);

  // "Producto" field.
  String? _producto;
  String get producto => _producto ?? '';
  set producto(String? val) => _producto = val;

  bool hasProducto() => _producto != null;

  // "Cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  set cantidad(int? val) => _cantidad = val;

  void incrementCantidad(int amount) => cantidad = cantidad + amount;

  bool hasCantidad() => _cantidad != null;

  static PedidosProveedorStruct fromMap(Map<String, dynamic> data) =>
      PedidosProveedorStruct(
        producto: data['Producto'] as String?,
        cantidad: castToType<int>(data['Cantidad']),
      );

  static PedidosProveedorStruct? maybeFromMap(dynamic data) => data is Map
      ? PedidosProveedorStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Producto': _producto,
        'Cantidad': _cantidad,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Producto': serializeParam(
          _producto,
          ParamType.String,
        ),
        'Cantidad': serializeParam(
          _cantidad,
          ParamType.int,
        ),
      }.withoutNulls;

  static PedidosProveedorStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PedidosProveedorStruct(
        producto: deserializeParam(
          data['Producto'],
          ParamType.String,
          false,
        ),
        cantidad: deserializeParam(
          data['Cantidad'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PedidosProveedorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PedidosProveedorStruct &&
        producto == other.producto &&
        cantidad == other.cantidad;
  }

  @override
  int get hashCode => const ListEquality().hash([producto, cantidad]);
}

PedidosProveedorStruct createPedidosProveedorStruct({
  String? producto,
  int? cantidad,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PedidosProveedorStruct(
      producto: producto,
      cantidad: cantidad,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PedidosProveedorStruct? updatePedidosProveedorStruct(
  PedidosProveedorStruct? pedidosProveedor, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pedidosProveedor
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPedidosProveedorStructData(
  Map<String, dynamic> firestoreData,
  PedidosProveedorStruct? pedidosProveedor,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pedidosProveedor == null) {
    return;
  }
  if (pedidosProveedor.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pedidosProveedor.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pedidosProveedorData =
      getPedidosProveedorFirestoreData(pedidosProveedor, forFieldValue);
  final nestedData =
      pedidosProveedorData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pedidosProveedor.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPedidosProveedorFirestoreData(
  PedidosProveedorStruct? pedidosProveedor, [
  bool forFieldValue = false,
]) {
  if (pedidosProveedor == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pedidosProveedor.toMap());

  // Add any Firestore field values
  pedidosProveedor.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPedidosProveedorListFirestoreData(
  List<PedidosProveedorStruct>? pedidosProveedors,
) =>
    pedidosProveedors
        ?.map((e) => getPedidosProveedorFirestoreData(e, true))
        .toList() ??
    [];
