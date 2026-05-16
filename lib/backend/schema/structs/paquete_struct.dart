// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PaqueteStruct extends FFFirebaseStruct {
  PaqueteStruct({
    int? precio,
    int? cantidad,
    String? imagen,
    int? calorias,
    String? descripcion,
    String? nombreProducto,
    DocumentReference? refProducto,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _precio = precio,
        _cantidad = cantidad,
        _imagen = imagen,
        _calorias = calorias,
        _descripcion = descripcion,
        _nombreProducto = nombreProducto,
        _refProducto = refProducto,
        super(firestoreUtilData);

  // "Precio" field.
  int? _precio;
  int get precio => _precio ?? 0;
  set precio(int? val) => _precio = val;

  void incrementPrecio(int amount) => precio = precio + amount;

  bool hasPrecio() => _precio != null;

  // "Cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  set cantidad(int? val) => _cantidad = val;

  void incrementCantidad(int amount) => cantidad = cantidad + amount;

  bool hasCantidad() => _cantidad != null;

  // "Imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  set imagen(String? val) => _imagen = val;

  bool hasImagen() => _imagen != null;

  // "Calorias" field.
  int? _calorias;
  int get calorias => _calorias ?? 0;
  set calorias(int? val) => _calorias = val;

  void incrementCalorias(int amount) => calorias = calorias + amount;

  bool hasCalorias() => _calorias != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  set descripcion(String? val) => _descripcion = val;

  bool hasDescripcion() => _descripcion != null;

  // "NombreProducto" field.
  String? _nombreProducto;
  String get nombreProducto => _nombreProducto ?? '';
  set nombreProducto(String? val) => _nombreProducto = val;

  bool hasNombreProducto() => _nombreProducto != null;

  // "refProducto" field.
  DocumentReference? _refProducto;
  DocumentReference? get refProducto => _refProducto;
  set refProducto(DocumentReference? val) => _refProducto = val;

  bool hasRefProducto() => _refProducto != null;

  static PaqueteStruct fromMap(Map<String, dynamic> data) => PaqueteStruct(
        precio: castToType<int>(data['Precio']),
        cantidad: castToType<int>(data['Cantidad']),
        imagen: data['Imagen'] as String?,
        calorias: castToType<int>(data['Calorias']),
        descripcion: data['Descripcion'] as String?,
        nombreProducto: data['NombreProducto'] as String?,
        refProducto: data['refProducto'] as DocumentReference?,
      );

  static PaqueteStruct? maybeFromMap(dynamic data) =>
      data is Map ? PaqueteStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Precio': _precio,
        'Cantidad': _cantidad,
        'Imagen': _imagen,
        'Calorias': _calorias,
        'Descripcion': _descripcion,
        'NombreProducto': _nombreProducto,
        'refProducto': _refProducto,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Precio': serializeParam(
          _precio,
          ParamType.int,
        ),
        'Cantidad': serializeParam(
          _cantidad,
          ParamType.int,
        ),
        'Imagen': serializeParam(
          _imagen,
          ParamType.String,
        ),
        'Calorias': serializeParam(
          _calorias,
          ParamType.int,
        ),
        'Descripcion': serializeParam(
          _descripcion,
          ParamType.String,
        ),
        'NombreProducto': serializeParam(
          _nombreProducto,
          ParamType.String,
        ),
        'refProducto': serializeParam(
          _refProducto,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static PaqueteStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaqueteStruct(
        precio: deserializeParam(
          data['Precio'],
          ParamType.int,
          false,
        ),
        cantidad: deserializeParam(
          data['Cantidad'],
          ParamType.int,
          false,
        ),
        imagen: deserializeParam(
          data['Imagen'],
          ParamType.String,
          false,
        ),
        calorias: deserializeParam(
          data['Calorias'],
          ParamType.int,
          false,
        ),
        descripcion: deserializeParam(
          data['Descripcion'],
          ParamType.String,
          false,
        ),
        nombreProducto: deserializeParam(
          data['NombreProducto'],
          ParamType.String,
          false,
        ),
        refProducto: deserializeParam(
          data['refProducto'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['PuntoDeVenta', 'Productos'],
        ),
      );

  @override
  String toString() => 'PaqueteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaqueteStruct &&
        precio == other.precio &&
        cantidad == other.cantidad &&
        imagen == other.imagen &&
        calorias == other.calorias &&
        descripcion == other.descripcion &&
        nombreProducto == other.nombreProducto &&
        refProducto == other.refProducto;
  }

  @override
  int get hashCode => const ListEquality().hash([
        precio,
        cantidad,
        imagen,
        calorias,
        descripcion,
        nombreProducto,
        refProducto
      ]);
}

PaqueteStruct createPaqueteStruct({
  int? precio,
  int? cantidad,
  String? imagen,
  int? calorias,
  String? descripcion,
  String? nombreProducto,
  DocumentReference? refProducto,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaqueteStruct(
      precio: precio,
      cantidad: cantidad,
      imagen: imagen,
      calorias: calorias,
      descripcion: descripcion,
      nombreProducto: nombreProducto,
      refProducto: refProducto,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PaqueteStruct? updatePaqueteStruct(
  PaqueteStruct? paquete, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paquete
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPaqueteStructData(
  Map<String, dynamic> firestoreData,
  PaqueteStruct? paquete,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paquete == null) {
    return;
  }
  if (paquete.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && paquete.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paqueteData = getPaqueteFirestoreData(paquete, forFieldValue);
  final nestedData = paqueteData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = paquete.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPaqueteFirestoreData(
  PaqueteStruct? paquete, [
  bool forFieldValue = false,
]) {
  if (paquete == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paquete.toMap());

  // Add any Firestore field values
  paquete.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaqueteListFirestoreData(
  List<PaqueteStruct>? paquetes,
) =>
    paquetes?.map((e) => getPaqueteFirestoreData(e, true)).toList() ?? [];
