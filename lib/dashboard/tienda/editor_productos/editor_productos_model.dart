import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editor_productos_widget.dart' show EditorProductosWidget;
import 'package:flutter/material.dart';

class EditorProductosModel extends FlutterFlowModel<EditorProductosWidget> {
  ///  Local state fields for this page.

  List<ProductosOrdenesClientesStruct> localProductosEnOrden = [];
  void addToLocalProductosEnOrden(ProductosOrdenesClientesStruct item) =>
      localProductosEnOrden.add(item);
  void removeFromLocalProductosEnOrden(ProductosOrdenesClientesStruct item) =>
      localProductosEnOrden.remove(item);
  void removeAtIndexFromLocalProductosEnOrden(int index) =>
      localProductosEnOrden.removeAt(index);
  void insertAtIndexInLocalProductosEnOrden(
          int index, ProductosOrdenesClientesStruct item) =>
      localProductosEnOrden.insert(index, item);
  void updateLocalProductosEnOrdenAtIndex(
          int index, Function(ProductosOrdenesClientesStruct) updateFn) =>
      localProductosEnOrden[index] = updateFn(localProductosEnOrden[index]);

  int? total;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
