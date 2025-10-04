// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RepartidorRutaStruct extends FFFirebaseStruct {
  RepartidorRutaStruct({
    String? dia,
    String? localizacion,
    bool? ocupado,
    int? enviosDisponibles,
    DocumentReference? refOrdenCompra,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dia = dia,
        _localizacion = localizacion,
        _ocupado = ocupado,
        _enviosDisponibles = enviosDisponibles,
        _refOrdenCompra = refOrdenCompra,
        super(firestoreUtilData);

  // "Dia" field.
  String? _dia;
  String get dia => _dia ?? '';
  set dia(String? val) => _dia = val;

  bool hasDia() => _dia != null;

  // "Localizacion" field.
  String? _localizacion;
  String get localizacion => _localizacion ?? '';
  set localizacion(String? val) => _localizacion = val;

  bool hasLocalizacion() => _localizacion != null;

  // "Ocupado" field.
  bool? _ocupado;
  bool get ocupado => _ocupado ?? false;
  set ocupado(bool? val) => _ocupado = val;

  bool hasOcupado() => _ocupado != null;

  // "enviosDisponibles" field.
  int? _enviosDisponibles;
  int get enviosDisponibles => _enviosDisponibles ?? 0;
  set enviosDisponibles(int? val) => _enviosDisponibles = val;

  void incrementEnviosDisponibles(int amount) =>
      enviosDisponibles = enviosDisponibles + amount;

  bool hasEnviosDisponibles() => _enviosDisponibles != null;

  // "refOrdenCompra" field.
  DocumentReference? _refOrdenCompra;
  DocumentReference? get refOrdenCompra => _refOrdenCompra;
  set refOrdenCompra(DocumentReference? val) => _refOrdenCompra = val;

  bool hasRefOrdenCompra() => _refOrdenCompra != null;

  static RepartidorRutaStruct fromMap(Map<String, dynamic> data) =>
      RepartidorRutaStruct(
        dia: data['Dia'] as String?,
        localizacion: data['Localizacion'] as String?,
        ocupado: data['Ocupado'] as bool?,
        enviosDisponibles: castToType<int>(data['enviosDisponibles']),
        refOrdenCompra: data['refOrdenCompra'] as DocumentReference?,
      );

  static RepartidorRutaStruct? maybeFromMap(dynamic data) => data is Map
      ? RepartidorRutaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Dia': _dia,
        'Localizacion': _localizacion,
        'Ocupado': _ocupado,
        'enviosDisponibles': _enviosDisponibles,
        'refOrdenCompra': _refOrdenCompra,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Dia': serializeParam(
          _dia,
          ParamType.String,
        ),
        'Localizacion': serializeParam(
          _localizacion,
          ParamType.String,
        ),
        'Ocupado': serializeParam(
          _ocupado,
          ParamType.bool,
        ),
        'enviosDisponibles': serializeParam(
          _enviosDisponibles,
          ParamType.int,
        ),
        'refOrdenCompra': serializeParam(
          _refOrdenCompra,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static RepartidorRutaStruct fromSerializableMap(Map<String, dynamic> data) =>
      RepartidorRutaStruct(
        dia: deserializeParam(
          data['Dia'],
          ParamType.String,
          false,
        ),
        localizacion: deserializeParam(
          data['Localizacion'],
          ParamType.String,
          false,
        ),
        ocupado: deserializeParam(
          data['Ocupado'],
          ParamType.bool,
          false,
        ),
        enviosDisponibles: deserializeParam(
          data['enviosDisponibles'],
          ParamType.int,
          false,
        ),
        refOrdenCompra: deserializeParam(
          data['refOrdenCompra'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['PuntoDeVenta', 'OdenCompra'],
        ),
      );

  @override
  String toString() => 'RepartidorRutaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RepartidorRutaStruct &&
        dia == other.dia &&
        localizacion == other.localizacion &&
        ocupado == other.ocupado &&
        enviosDisponibles == other.enviosDisponibles &&
        refOrdenCompra == other.refOrdenCompra;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([dia, localizacion, ocupado, enviosDisponibles, refOrdenCompra]);
}

RepartidorRutaStruct createRepartidorRutaStruct({
  String? dia,
  String? localizacion,
  bool? ocupado,
  int? enviosDisponibles,
  DocumentReference? refOrdenCompra,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RepartidorRutaStruct(
      dia: dia,
      localizacion: localizacion,
      ocupado: ocupado,
      enviosDisponibles: enviosDisponibles,
      refOrdenCompra: refOrdenCompra,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RepartidorRutaStruct? updateRepartidorRutaStruct(
  RepartidorRutaStruct? repartidorRuta, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    repartidorRuta
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRepartidorRutaStructData(
  Map<String, dynamic> firestoreData,
  RepartidorRutaStruct? repartidorRuta,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (repartidorRuta == null) {
    return;
  }
  if (repartidorRuta.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && repartidorRuta.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final repartidorRutaData =
      getRepartidorRutaFirestoreData(repartidorRuta, forFieldValue);
  final nestedData =
      repartidorRutaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = repartidorRuta.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRepartidorRutaFirestoreData(
  RepartidorRutaStruct? repartidorRuta, [
  bool forFieldValue = false,
]) {
  if (repartidorRuta == null) {
    return {};
  }
  final firestoreData = mapToFirestore(repartidorRuta.toMap());

  // Add any Firestore field values
  repartidorRuta.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRepartidorRutaListFirestoreData(
  List<RepartidorRutaStruct>? repartidorRutas,
) =>
    repartidorRutas
        ?.map((e) => getRepartidorRutaFirestoreData(e, true))
        .toList() ??
    [];
