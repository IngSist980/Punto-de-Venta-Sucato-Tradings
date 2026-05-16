import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_productos_order_widget.dart' show AddProductosOrderWidget;
import 'package:flutter/material.dart';

class AddProductosOrderModel extends FlutterFlowModel<AddProductosOrderWidget> {
  ///  Local state fields for this component.

  List<PedidosProveedorStruct> productosSeleccionadosLocales = [];
  void addToProductosSeleccionadosLocales(PedidosProveedorStruct item) =>
      productosSeleccionadosLocales.add(item);
  void removeFromProductosSeleccionadosLocales(PedidosProveedorStruct item) =>
      productosSeleccionadosLocales.remove(item);
  void removeAtIndexFromProductosSeleccionadosLocales(int index) =>
      productosSeleccionadosLocales.removeAt(index);
  void insertAtIndexInProductosSeleccionadosLocales(
          int index, PedidosProveedorStruct item) =>
      productosSeleccionadosLocales.insert(index, item);
  void updateProductosSeleccionadosLocalesAtIndex(
          int index, Function(PedidosProveedorStruct) updateFn) =>
      productosSeleccionadosLocales[index] =
          updateFn(productosSeleccionadosLocales[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
