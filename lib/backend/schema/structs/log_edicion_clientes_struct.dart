// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LogEdicionClientesStruct extends FFFirebaseStruct {
  LogEdicionClientesStruct({
    DateTime? fechaEdicion,
    String? razonSocial,
    String? cedulaJuridica,
    String? direccion,
    String? nombreContacto,
    String? telefonoContacto,
    String? categoria,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fechaEdicion = fechaEdicion,
        _razonSocial = razonSocial,
        _cedulaJuridica = cedulaJuridica,
        _direccion = direccion,
        _nombreContacto = nombreContacto,
        _telefonoContacto = telefonoContacto,
        _categoria = categoria,
        super(firestoreUtilData);

  // "FechaEdicion" field.
  DateTime? _fechaEdicion;
  DateTime? get fechaEdicion => _fechaEdicion;
  set fechaEdicion(DateTime? val) => _fechaEdicion = val;

  bool hasFechaEdicion() => _fechaEdicion != null;

  // "RazonSocial" field.
  String? _razonSocial;
  String get razonSocial => _razonSocial ?? '';
  set razonSocial(String? val) => _razonSocial = val;

  bool hasRazonSocial() => _razonSocial != null;

  // "CedulaJuridica" field.
  String? _cedulaJuridica;
  String get cedulaJuridica => _cedulaJuridica ?? '';
  set cedulaJuridica(String? val) => _cedulaJuridica = val;

  bool hasCedulaJuridica() => _cedulaJuridica != null;

  // "Direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  set direccion(String? val) => _direccion = val;

  bool hasDireccion() => _direccion != null;

  // "NombreContacto" field.
  String? _nombreContacto;
  String get nombreContacto => _nombreContacto ?? '';
  set nombreContacto(String? val) => _nombreContacto = val;

  bool hasNombreContacto() => _nombreContacto != null;

  // "TelefonoContacto" field.
  String? _telefonoContacto;
  String get telefonoContacto => _telefonoContacto ?? '';
  set telefonoContacto(String? val) => _telefonoContacto = val;

  bool hasTelefonoContacto() => _telefonoContacto != null;

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

  static LogEdicionClientesStruct fromMap(Map<String, dynamic> data) =>
      LogEdicionClientesStruct(
        fechaEdicion: data['FechaEdicion'] as DateTime?,
        razonSocial: data['RazonSocial'] as String?,
        cedulaJuridica: data['CedulaJuridica'] as String?,
        direccion: data['Direccion'] as String?,
        nombreContacto: data['NombreContacto'] as String?,
        telefonoContacto: data['TelefonoContacto'] as String?,
        categoria: data['Categoria'] as String?,
      );

  static LogEdicionClientesStruct? maybeFromMap(dynamic data) => data is Map
      ? LogEdicionClientesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'FechaEdicion': _fechaEdicion,
        'RazonSocial': _razonSocial,
        'CedulaJuridica': _cedulaJuridica,
        'Direccion': _direccion,
        'NombreContacto': _nombreContacto,
        'TelefonoContacto': _telefonoContacto,
        'Categoria': _categoria,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'FechaEdicion': serializeParam(
          _fechaEdicion,
          ParamType.DateTime,
        ),
        'RazonSocial': serializeParam(
          _razonSocial,
          ParamType.String,
        ),
        'CedulaJuridica': serializeParam(
          _cedulaJuridica,
          ParamType.String,
        ),
        'Direccion': serializeParam(
          _direccion,
          ParamType.String,
        ),
        'NombreContacto': serializeParam(
          _nombreContacto,
          ParamType.String,
        ),
        'TelefonoContacto': serializeParam(
          _telefonoContacto,
          ParamType.String,
        ),
        'Categoria': serializeParam(
          _categoria,
          ParamType.String,
        ),
      }.withoutNulls;

  static LogEdicionClientesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LogEdicionClientesStruct(
        fechaEdicion: deserializeParam(
          data['FechaEdicion'],
          ParamType.DateTime,
          false,
        ),
        razonSocial: deserializeParam(
          data['RazonSocial'],
          ParamType.String,
          false,
        ),
        cedulaJuridica: deserializeParam(
          data['CedulaJuridica'],
          ParamType.String,
          false,
        ),
        direccion: deserializeParam(
          data['Direccion'],
          ParamType.String,
          false,
        ),
        nombreContacto: deserializeParam(
          data['NombreContacto'],
          ParamType.String,
          false,
        ),
        telefonoContacto: deserializeParam(
          data['TelefonoContacto'],
          ParamType.String,
          false,
        ),
        categoria: deserializeParam(
          data['Categoria'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LogEdicionClientesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LogEdicionClientesStruct &&
        fechaEdicion == other.fechaEdicion &&
        razonSocial == other.razonSocial &&
        cedulaJuridica == other.cedulaJuridica &&
        direccion == other.direccion &&
        nombreContacto == other.nombreContacto &&
        telefonoContacto == other.telefonoContacto &&
        categoria == other.categoria;
  }

  @override
  int get hashCode => const ListEquality().hash([
        fechaEdicion,
        razonSocial,
        cedulaJuridica,
        direccion,
        nombreContacto,
        telefonoContacto,
        categoria
      ]);
}

LogEdicionClientesStruct createLogEdicionClientesStruct({
  DateTime? fechaEdicion,
  String? razonSocial,
  String? cedulaJuridica,
  String? direccion,
  String? nombreContacto,
  String? telefonoContacto,
  String? categoria,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LogEdicionClientesStruct(
      fechaEdicion: fechaEdicion,
      razonSocial: razonSocial,
      cedulaJuridica: cedulaJuridica,
      direccion: direccion,
      nombreContacto: nombreContacto,
      telefonoContacto: telefonoContacto,
      categoria: categoria,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LogEdicionClientesStruct? updateLogEdicionClientesStruct(
  LogEdicionClientesStruct? logEdicionClientes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    logEdicionClientes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLogEdicionClientesStructData(
  Map<String, dynamic> firestoreData,
  LogEdicionClientesStruct? logEdicionClientes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (logEdicionClientes == null) {
    return;
  }
  if (logEdicionClientes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && logEdicionClientes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final logEdicionClientesData =
      getLogEdicionClientesFirestoreData(logEdicionClientes, forFieldValue);
  final nestedData =
      logEdicionClientesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      logEdicionClientes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLogEdicionClientesFirestoreData(
  LogEdicionClientesStruct? logEdicionClientes, [
  bool forFieldValue = false,
]) {
  if (logEdicionClientes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(logEdicionClientes.toMap());

  // Add any Firestore field values
  logEdicionClientes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLogEdicionClientesListFirestoreData(
  List<LogEdicionClientesStruct>? logEdicionClientess,
) =>
    logEdicionClientess
        ?.map((e) => getLogEdicionClientesFirestoreData(e, true))
        .toList() ??
    [];
