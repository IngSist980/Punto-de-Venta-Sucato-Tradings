import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdenesProveedorRecord extends FirestoreRecord {
  OrdenesProveedorRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ProveedorNombre" field.
  String? _proveedorNombre;
  String get proveedorNombre => _proveedorNombre ?? '';
  bool hasProveedorNombre() => _proveedorNombre != null;

  // "ProvedorRef" field.
  DocumentReference? _provedorRef;
  DocumentReference? get provedorRef => _provedorRef;
  bool hasProvedorRef() => _provedorRef != null;

  // "FechaEmision" field.
  DateTime? _fechaEmision;
  DateTime? get fechaEmision => _fechaEmision;
  bool hasFechaEmision() => _fechaEmision != null;

  // "Estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  // "Productos" field.
  List<PedidosProveedorStruct>? _productos;
  List<PedidosProveedorStruct> get productos => _productos ?? const [];
  bool hasProductos() => _productos != null;

  // "NumeroOrden" field.
  String? _numeroOrden;
  String get numeroOrden => _numeroOrden ?? '';
  bool hasNumeroOrden() => _numeroOrden != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _proveedorNombre = snapshotData['ProveedorNombre'] as String?;
    _provedorRef = snapshotData['ProvedorRef'] as DocumentReference?;
    _fechaEmision = snapshotData['FechaEmision'] as DateTime?;
    _estado = snapshotData['Estado'] as bool?;
    _productos = getStructList(
      snapshotData['Productos'],
      PedidosProveedorStruct.fromMap,
    );
    _numeroOrden = snapshotData['NumeroOrden'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('OrdenesProveedor')
          : FirebaseFirestore.instance.collectionGroup('OrdenesProveedor');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('OrdenesProveedor').doc(id);

  static Stream<OrdenesProveedorRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdenesProveedorRecord.fromSnapshot(s));

  static Future<OrdenesProveedorRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => OrdenesProveedorRecord.fromSnapshot(s));

  static OrdenesProveedorRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrdenesProveedorRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdenesProveedorRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdenesProveedorRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdenesProveedorRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdenesProveedorRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdenesProveedorRecordData({
  String? proveedorNombre,
  DocumentReference? provedorRef,
  DateTime? fechaEmision,
  bool? estado,
  String? numeroOrden,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ProveedorNombre': proveedorNombre,
      'ProvedorRef': provedorRef,
      'FechaEmision': fechaEmision,
      'Estado': estado,
      'NumeroOrden': numeroOrden,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdenesProveedorRecordDocumentEquality
    implements Equality<OrdenesProveedorRecord> {
  const OrdenesProveedorRecordDocumentEquality();

  @override
  bool equals(OrdenesProveedorRecord? e1, OrdenesProveedorRecord? e2) {
    const listEquality = ListEquality();
    return e1?.proveedorNombre == e2?.proveedorNombre &&
        e1?.provedorRef == e2?.provedorRef &&
        e1?.fechaEmision == e2?.fechaEmision &&
        e1?.estado == e2?.estado &&
        listEquality.equals(e1?.productos, e2?.productos) &&
        e1?.numeroOrden == e2?.numeroOrden;
  }

  @override
  int hash(OrdenesProveedorRecord? e) => const ListEquality().hash([
        e?.proveedorNombre,
        e?.provedorRef,
        e?.fechaEmision,
        e?.estado,
        e?.productos,
        e?.numeroOrden
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdenesProveedorRecord;
}
