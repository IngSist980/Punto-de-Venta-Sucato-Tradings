import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Carrito = prefs
              .getStringList('ff_Carrito')
              ?.map((x) {
                try {
                  return ProductosOrdenesClientesStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Carrito;
    });
    _safeInit(() {
      _impuesto = prefs.getInt('ff_impuesto') ?? _impuesto;
    });
    _safeInit(() {
      _TotalCarrito = prefs.getInt('ff_TotalCarrito') ?? _TotalCarrito;
    });
    _safeInit(() {
      _fechaCierreCaja = prefs.containsKey('ff_fechaCierreCaja')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_fechaCierreCaja')!)
          : _fechaCierreCaja;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _modulo = '';
  String get modulo => _modulo;
  set modulo(String value) {
    _modulo = value;
  }

  List<ProductosOrdenesClientesStruct> _Carrito = [];
  List<ProductosOrdenesClientesStruct> get Carrito => _Carrito;
  set Carrito(List<ProductosOrdenesClientesStruct> value) {
    _Carrito = value;
    prefs.setStringList('ff_Carrito', value.map((x) => x.serialize()).toList());
  }

  void addToCarrito(ProductosOrdenesClientesStruct value) {
    Carrito.add(value);
    prefs.setStringList(
        'ff_Carrito', _Carrito.map((x) => x.serialize()).toList());
  }

  void removeFromCarrito(ProductosOrdenesClientesStruct value) {
    Carrito.remove(value);
    prefs.setStringList(
        'ff_Carrito', _Carrito.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCarrito(int index) {
    Carrito.removeAt(index);
    prefs.setStringList(
        'ff_Carrito', _Carrito.map((x) => x.serialize()).toList());
  }

  void updateCarritoAtIndex(
    int index,
    ProductosOrdenesClientesStruct Function(ProductosOrdenesClientesStruct)
        updateFn,
  ) {
    Carrito[index] = updateFn(_Carrito[index]);
    prefs.setStringList(
        'ff_Carrito', _Carrito.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCarrito(int index, ProductosOrdenesClientesStruct value) {
    Carrito.insert(index, value);
    prefs.setStringList(
        'ff_Carrito', _Carrito.map((x) => x.serialize()).toList());
  }

  int _impuesto = 13;
  int get impuesto => _impuesto;
  set impuesto(int value) {
    _impuesto = value;
    prefs.setInt('ff_impuesto', value);
  }

  int _TotalCarrito = 0;
  int get TotalCarrito => _TotalCarrito;
  set TotalCarrito(int value) {
    _TotalCarrito = value;
    prefs.setInt('ff_TotalCarrito', value);
  }

  DateTime? _fechaCierreCaja;
  DateTime? get fechaCierreCaja => _fechaCierreCaja;
  set fechaCierreCaja(DateTime? value) {
    _fechaCierreCaja = value;
    value != null
        ? prefs.setInt('ff_fechaCierreCaja', value.millisecondsSinceEpoch)
        : prefs.remove('ff_fechaCierreCaja');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
