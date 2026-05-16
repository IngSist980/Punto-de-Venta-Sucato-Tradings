import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RepartidorRecord extends FirestoreRecord {
  RepartidorRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "NombreRepartidor" field.
  String? _nombreRepartidor;
  String get nombreRepartidor => _nombreRepartidor ?? '';
  bool hasNombreRepartidor() => _nombreRepartidor != null;

  // "Telefono" field.
  String? _telefono;
  String get telefono => _telefono ?? '';
  bool hasTelefono() => _telefono != null;

  // "Vehiculo" field.
  String? _vehiculo;
  String get vehiculo => _vehiculo ?? '';
  bool hasVehiculo() => _vehiculo != null;

  // "Placa" field.
  String? _placa;
  String get placa => _placa ?? '';
  bool hasPlaca() => _placa != null;

  // "Estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  // "Horario" field.
  List<RepartidorRutaStruct>? _horario;
  List<RepartidorRutaStruct> get horario => _horario ?? const [];
  bool hasHorario() => _horario != null;

  // "OrdenCompra" field.
  DocumentReference? _ordenCompra;
  DocumentReference? get ordenCompra => _ordenCompra;
  bool hasOrdenCompra() => _ordenCompra != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nombreRepartidor = snapshotData['NombreRepartidor'] as String?;
    _telefono = snapshotData['Telefono'] as String?;
    _vehiculo = snapshotData['Vehiculo'] as String?;
    _placa = snapshotData['Placa'] as String?;
    _estado = snapshotData['Estado'] as bool?;
    _horario = getStructList(
      snapshotData['Horario'],
      RepartidorRutaStruct.fromMap,
    );
    _ordenCompra = snapshotData['OrdenCompra'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Repartidor')
          : FirebaseFirestore.instance.collectionGroup('Repartidor');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Repartidor').doc(id);

  static Stream<RepartidorRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RepartidorRecord.fromSnapshot(s));

  static Future<RepartidorRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RepartidorRecord.fromSnapshot(s));

  static RepartidorRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RepartidorRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RepartidorRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RepartidorRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RepartidorRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RepartidorRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRepartidorRecordData({
  String? nombreRepartidor,
  String? telefono,
  String? vehiculo,
  String? placa,
  bool? estado,
  DocumentReference? ordenCompra,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NombreRepartidor': nombreRepartidor,
      'Telefono': telefono,
      'Vehiculo': vehiculo,
      'Placa': placa,
      'Estado': estado,
      'OrdenCompra': ordenCompra,
    }.withoutNulls,
  );

  return firestoreData;
}

class RepartidorRecordDocumentEquality implements Equality<RepartidorRecord> {
  const RepartidorRecordDocumentEquality();

  @override
  bool equals(RepartidorRecord? e1, RepartidorRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nombreRepartidor == e2?.nombreRepartidor &&
        e1?.telefono == e2?.telefono &&
        e1?.vehiculo == e2?.vehiculo &&
        e1?.placa == e2?.placa &&
        e1?.estado == e2?.estado &&
        listEquality.equals(e1?.horario, e2?.horario) &&
        e1?.ordenCompra == e2?.ordenCompra;
  }

  @override
  int hash(RepartidorRecord? e) => const ListEquality().hash([
        e?.nombreRepartidor,
        e?.telefono,
        e?.vehiculo,
        e?.placa,
        e?.estado,
        e?.horario,
        e?.ordenCompra
      ]);

  @override
  bool isValidKey(Object? o) => o is RepartidorRecord;
}
