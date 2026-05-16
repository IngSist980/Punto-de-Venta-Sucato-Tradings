import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KitsRecord extends FirestoreRecord {
  KitsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "NombreKit" field.
  String? _nombreKit;
  String get nombreKit => _nombreKit ?? '';
  bool hasNombreKit() => _nombreKit != null;

  // "Productos" field.
  List<PaqueteStruct>? _productos;
  List<PaqueteStruct> get productos => _productos ?? const [];
  bool hasProductos() => _productos != null;

  // "Created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "Estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  // "CaducidadValue" field.
  int? _caducidadValue;
  int get caducidadValue => _caducidadValue ?? 0;
  bool hasCaducidadValue() => _caducidadValue != null;

  // "Caducidad" field.
  DateTime? _caducidad;
  DateTime? get caducidad => _caducidad;
  bool hasCaducidad() => _caducidad != null;

  // "SKU" field.
  String? _sku;
  String get sku => _sku ?? '';
  bool hasSku() => _sku != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "PrecioKit" field.
  int? _precioKit;
  int get precioKit => _precioKit ?? 0;
  bool hasPrecioKit() => _precioKit != null;

  // "PrecioTotalNeto" field.
  int? _precioTotalNeto;
  int get precioTotalNeto => _precioTotalNeto ?? 0;
  bool hasPrecioTotalNeto() => _precioTotalNeto != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nombreKit = snapshotData['NombreKit'] as String?;
    _productos = getStructList(
      snapshotData['Productos'],
      PaqueteStruct.fromMap,
    );
    _createdTime = snapshotData['Created_time'] as DateTime?;
    _estado = snapshotData['Estado'] as bool?;
    _caducidadValue = castToType<int>(snapshotData['CaducidadValue']);
    _caducidad = snapshotData['Caducidad'] as DateTime?;
    _sku = snapshotData['SKU'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _precioKit = castToType<int>(snapshotData['PrecioKit']);
    _precioTotalNeto = castToType<int>(snapshotData['PrecioTotalNeto']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Kits')
          : FirebaseFirestore.instance.collectionGroup('Kits');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Kits').doc(id);

  static Stream<KitsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KitsRecord.fromSnapshot(s));

  static Future<KitsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KitsRecord.fromSnapshot(s));

  static KitsRecord fromSnapshot(DocumentSnapshot snapshot) => KitsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KitsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KitsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KitsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KitsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKitsRecordData({
  String? nombreKit,
  DateTime? createdTime,
  bool? estado,
  int? caducidadValue,
  DateTime? caducidad,
  String? sku,
  String? descripcion,
  int? precioKit,
  int? precioTotalNeto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NombreKit': nombreKit,
      'Created_time': createdTime,
      'Estado': estado,
      'CaducidadValue': caducidadValue,
      'Caducidad': caducidad,
      'SKU': sku,
      'Descripcion': descripcion,
      'PrecioKit': precioKit,
      'PrecioTotalNeto': precioTotalNeto,
    }.withoutNulls,
  );

  return firestoreData;
}

class KitsRecordDocumentEquality implements Equality<KitsRecord> {
  const KitsRecordDocumentEquality();

  @override
  bool equals(KitsRecord? e1, KitsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nombreKit == e2?.nombreKit &&
        listEquality.equals(e1?.productos, e2?.productos) &&
        e1?.createdTime == e2?.createdTime &&
        e1?.estado == e2?.estado &&
        e1?.caducidadValue == e2?.caducidadValue &&
        e1?.caducidad == e2?.caducidad &&
        e1?.sku == e2?.sku &&
        e1?.descripcion == e2?.descripcion &&
        e1?.precioKit == e2?.precioKit &&
        e1?.precioTotalNeto == e2?.precioTotalNeto;
  }

  @override
  int hash(KitsRecord? e) => const ListEquality().hash([
        e?.nombreKit,
        e?.productos,
        e?.createdTime,
        e?.estado,
        e?.caducidadValue,
        e?.caducidad,
        e?.sku,
        e?.descripcion,
        e?.precioKit,
        e?.precioTotalNeto
      ]);

  @override
  bool isValidKey(Object? o) => o is KitsRecord;
}
