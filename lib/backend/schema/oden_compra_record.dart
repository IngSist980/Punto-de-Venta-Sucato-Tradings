import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OdenCompraRecord extends FirestoreRecord {
  OdenCompraRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "FechaEmision" field.
  DateTime? _fechaEmision;
  DateTime? get fechaEmision => _fechaEmision;
  bool hasFechaEmision() => _fechaEmision != null;

  // "NumeroOrden" field.
  String? _numeroOrden;
  String get numeroOrden => _numeroOrden ?? '';
  bool hasNumeroOrden() => _numeroOrden != null;

  // "ProdcutosComprados" field.
  List<ProductosOrdenesClientesStruct>? _prodcutosComprados;
  List<ProductosOrdenesClientesStruct> get prodcutosComprados =>
      _prodcutosComprados ?? const [];
  bool hasProdcutosComprados() => _prodcutosComprados != null;

  // "Total" field.
  int? _total;
  int get total => _total ?? 0;
  bool hasTotal() => _total != null;

  // "Descuento" field.
  int? _descuento;
  int get descuento => _descuento ?? 0;
  bool hasDescuento() => _descuento != null;

  // "Estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "EmpleadoNombre" field.
  String? _empleadoNombre;
  String get empleadoNombre => _empleadoNombre ?? '';
  bool hasEmpleadoNombre() => _empleadoNombre != null;

  // "Despachado" field.
  bool? _despachado;
  bool get despachado => _despachado ?? false;
  bool hasDespachado() => _despachado != null;

  // "refRepartidor" field.
  DocumentReference? _refRepartidor;
  DocumentReference? get refRepartidor => _refRepartidor;
  bool hasRefRepartidor() => _refRepartidor != null;

  // "RepartidorNombre" field.
  String? _repartidorNombre;
  String get repartidorNombre => _repartidorNombre ?? '';
  bool hasRepartidorNombre() => _repartidorNombre != null;

  // "MotivoEstado" field.
  String? _motivoEstado;
  String get motivoEstado => _motivoEstado ?? '';
  bool hasMotivoEstado() => _motivoEstado != null;

  // "TotalAPagar" field.
  double? _totalAPagar;
  double get totalAPagar => _totalAPagar ?? 0.0;
  bool hasTotalAPagar() => _totalAPagar != null;

  // "DireccionDespacho" field.
  String? _direccionDespacho;
  String get direccionDespacho => _direccionDespacho ?? '';
  bool hasDireccionDespacho() => _direccionDespacho != null;

  // "EntregaPersonal" field.
  bool? _entregaPersonal;
  bool get entregaPersonal => _entregaPersonal ?? false;
  bool hasEntregaPersonal() => _entregaPersonal != null;

  // "DiaReparto" field.
  String? _diaReparto;
  String get diaReparto => _diaReparto ?? '';
  bool hasDiaReparto() => _diaReparto != null;

  // "Impuesto" field.
  double? _impuesto;
  double get impuesto => _impuesto ?? 0.0;
  bool hasImpuesto() => _impuesto != null;

  // "MetodoPago" field.
  String? _metodoPago;
  String get metodoPago => _metodoPago ?? '';
  bool hasMetodoPago() => _metodoPago != null;

  // "Credito" field.
  double? _credito;
  double get credito => _credito ?? 0.0;
  bool hasCredito() => _credito != null;

  // "refClienteFrecuente" field.
  DocumentReference? _refClienteFrecuente;
  DocumentReference? get refClienteFrecuente => _refClienteFrecuente;
  bool hasRefClienteFrecuente() => _refClienteFrecuente != null;

  // "refDevolucion" field.
  DocumentReference? _refDevolucion;
  DocumentReference? get refDevolucion => _refDevolucion;
  bool hasRefDevolucion() => _refDevolucion != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nombre = snapshotData['Nombre'] as String?;
    _fechaEmision = snapshotData['FechaEmision'] as DateTime?;
    _numeroOrden = snapshotData['NumeroOrden'] as String?;
    _prodcutosComprados = getStructList(
      snapshotData['ProdcutosComprados'],
      ProductosOrdenesClientesStruct.fromMap,
    );
    _total = castToType<int>(snapshotData['Total']);
    _descuento = castToType<int>(snapshotData['Descuento']);
    _estado = snapshotData['Estado'] as String?;
    _empleadoNombre = snapshotData['EmpleadoNombre'] as String?;
    _despachado = snapshotData['Despachado'] as bool?;
    _refRepartidor = snapshotData['refRepartidor'] as DocumentReference?;
    _repartidorNombre = snapshotData['RepartidorNombre'] as String?;
    _motivoEstado = snapshotData['MotivoEstado'] as String?;
    _totalAPagar = castToType<double>(snapshotData['TotalAPagar']);
    _direccionDespacho = snapshotData['DireccionDespacho'] as String?;
    _entregaPersonal = snapshotData['EntregaPersonal'] as bool?;
    _diaReparto = snapshotData['DiaReparto'] as String?;
    _impuesto = castToType<double>(snapshotData['Impuesto']);
    _metodoPago = snapshotData['MetodoPago'] as String?;
    _credito = castToType<double>(snapshotData['Credito']);
    _refClienteFrecuente =
        snapshotData['refClienteFrecuente'] as DocumentReference?;
    _refDevolucion = snapshotData['refDevolucion'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('OdenCompra')
          : FirebaseFirestore.instance.collectionGroup('OdenCompra');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('OdenCompra').doc(id);

  static Stream<OdenCompraRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OdenCompraRecord.fromSnapshot(s));

  static Future<OdenCompraRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OdenCompraRecord.fromSnapshot(s));

  static OdenCompraRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OdenCompraRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OdenCompraRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OdenCompraRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OdenCompraRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OdenCompraRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOdenCompraRecordData({
  String? nombre,
  DateTime? fechaEmision,
  String? numeroOrden,
  int? total,
  int? descuento,
  String? estado,
  String? empleadoNombre,
  bool? despachado,
  DocumentReference? refRepartidor,
  String? repartidorNombre,
  String? motivoEstado,
  double? totalAPagar,
  String? direccionDespacho,
  bool? entregaPersonal,
  String? diaReparto,
  double? impuesto,
  String? metodoPago,
  double? credito,
  DocumentReference? refClienteFrecuente,
  DocumentReference? refDevolucion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nombre': nombre,
      'FechaEmision': fechaEmision,
      'NumeroOrden': numeroOrden,
      'Total': total,
      'Descuento': descuento,
      'Estado': estado,
      'EmpleadoNombre': empleadoNombre,
      'Despachado': despachado,
      'refRepartidor': refRepartidor,
      'RepartidorNombre': repartidorNombre,
      'MotivoEstado': motivoEstado,
      'TotalAPagar': totalAPagar,
      'DireccionDespacho': direccionDespacho,
      'EntregaPersonal': entregaPersonal,
      'DiaReparto': diaReparto,
      'Impuesto': impuesto,
      'MetodoPago': metodoPago,
      'Credito': credito,
      'refClienteFrecuente': refClienteFrecuente,
      'refDevolucion': refDevolucion,
    }.withoutNulls,
  );

  return firestoreData;
}

class OdenCompraRecordDocumentEquality implements Equality<OdenCompraRecord> {
  const OdenCompraRecordDocumentEquality();

  @override
  bool equals(OdenCompraRecord? e1, OdenCompraRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nombre == e2?.nombre &&
        e1?.fechaEmision == e2?.fechaEmision &&
        e1?.numeroOrden == e2?.numeroOrden &&
        listEquality.equals(e1?.prodcutosComprados, e2?.prodcutosComprados) &&
        e1?.total == e2?.total &&
        e1?.descuento == e2?.descuento &&
        e1?.estado == e2?.estado &&
        e1?.empleadoNombre == e2?.empleadoNombre &&
        e1?.despachado == e2?.despachado &&
        e1?.refRepartidor == e2?.refRepartidor &&
        e1?.repartidorNombre == e2?.repartidorNombre &&
        e1?.motivoEstado == e2?.motivoEstado &&
        e1?.totalAPagar == e2?.totalAPagar &&
        e1?.direccionDespacho == e2?.direccionDespacho &&
        e1?.entregaPersonal == e2?.entregaPersonal &&
        e1?.diaReparto == e2?.diaReparto &&
        e1?.impuesto == e2?.impuesto &&
        e1?.metodoPago == e2?.metodoPago &&
        e1?.credito == e2?.credito &&
        e1?.refClienteFrecuente == e2?.refClienteFrecuente &&
        e1?.refDevolucion == e2?.refDevolucion;
  }

  @override
  int hash(OdenCompraRecord? e) => const ListEquality().hash([
        e?.nombre,
        e?.fechaEmision,
        e?.numeroOrden,
        e?.prodcutosComprados,
        e?.total,
        e?.descuento,
        e?.estado,
        e?.empleadoNombre,
        e?.despachado,
        e?.refRepartidor,
        e?.repartidorNombre,
        e?.motivoEstado,
        e?.totalAPagar,
        e?.direccionDespacho,
        e?.entregaPersonal,
        e?.diaReparto,
        e?.impuesto,
        e?.metodoPago,
        e?.credito,
        e?.refClienteFrecuente,
        e?.refDevolucion
      ]);

  @override
  bool isValidKey(Object? o) => o is OdenCompraRecord;
}
