import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_view_ordenes_proveedor_widget.dart'
    show UpdateViewOrdenesProveedorWidget;
import 'package:flutter/material.dart';

class UpdateViewOrdenesProveedorModel
    extends FlutterFlowModel<UpdateViewOrdenesProveedorWidget> {
  ///  Local state fields for this component.

  List<PedidosProveedorStruct> productosDeLaOrden = [];
  void addToProductosDeLaOrden(PedidosProveedorStruct item) =>
      productosDeLaOrden.add(item);
  void removeFromProductosDeLaOrden(PedidosProveedorStruct item) =>
      productosDeLaOrden.remove(item);
  void removeAtIndexFromProductosDeLaOrden(int index) =>
      productosDeLaOrden.removeAt(index);
  void insertAtIndexInProductosDeLaOrden(
          int index, PedidosProveedorStruct item) =>
      productosDeLaOrden.insert(index, item);
  void updateProductosDeLaOrdenAtIndex(
          int index, Function(PedidosProveedorStruct) updateFn) =>
      productosDeLaOrden[index] = updateFn(productosDeLaOrden[index]);

  bool verAgregar = false;

  List<ProductosProveedoresStruct> productosDelProveedor = [];
  void addToProductosDelProveedor(ProductosProveedoresStruct item) =>
      productosDelProveedor.add(item);
  void removeFromProductosDelProveedor(ProductosProveedoresStruct item) =>
      productosDelProveedor.remove(item);
  void removeAtIndexFromProductosDelProveedor(int index) =>
      productosDelProveedor.removeAt(index);
  void insertAtIndexInProductosDelProveedor(
          int index, ProductosProveedoresStruct item) =>
      productosDelProveedor.insert(index, item);
  void updateProductosDelProveedorAtIndex(
          int index, Function(ProductosProveedoresStruct) updateFn) =>
      productosDelProveedor[index] = updateFn(productosDelProveedor[index]);

  DocumentReference? refProveedores;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Estado widget.
  bool? estadoValue;
  // State field(s) for ProveedorName widget.
  FocusNode? proveedorNameFocusNode;
  TextEditingController? proveedorNameTextController;
  String? Function(BuildContext, String?)? proveedorNameTextControllerValidator;
  // State field(s) for uniqueID widget.
  FocusNode? uniqueIDFocusNode;
  TextEditingController? uniqueIDTextController;
  String? Function(BuildContext, String?)? uniqueIDTextControllerValidator;
  // State field(s) for FechaEmision widget.
  FocusNode? fechaEmisionFocusNode;
  TextEditingController? fechaEmisionTextController;
  String? Function(BuildContext, String?)? fechaEmisionTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    proveedorNameFocusNode?.dispose();
    proveedorNameTextController?.dispose();

    uniqueIDFocusNode?.dispose();
    uniqueIDTextController?.dispose();

    fechaEmisionFocusNode?.dispose();
    fechaEmisionTextController?.dispose();
  }
}
