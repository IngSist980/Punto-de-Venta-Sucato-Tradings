import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_read_ordenes_proveedor_widget.dart'
    show CreateReadOrdenesProveedorWidget;
import 'package:flutter/material.dart';

class CreateReadOrdenesProveedorModel
    extends FlutterFlowModel<CreateReadOrdenesProveedorWidget> {
  ///  Local state fields for this page.

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

  bool verAgregarProducto = false;

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

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for buscar widget.
  FocusNode? buscarFocusNode;
  TextEditingController? buscarTextController;
  String? Function(BuildContext, String?)? buscarTextControllerValidator;
  // State field(s) for DropDownEstado widget.
  bool? dropDownEstadoValue;
  FormFieldController<bool>? dropDownEstadoValueController;
  // State field(s) for Estado widget.
  bool? estadoValue;
  // State field(s) for ProveedorDrown widget.
  String? proveedorDrownValue;
  FormFieldController<String>? proveedorDrownValueController;
  // State field(s) for uniqueID widget.
  FocusNode? uniqueIDFocusNode;
  TextEditingController? uniqueIDTextController;
  String? Function(BuildContext, String?)? uniqueIDTextControllerValidator;
  String? _uniqueIDTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nombre Proveedor es requerido';
    }

    return null;
  }

  // State field(s) for FechaEmision widget.
  FocusNode? fechaEmisionFocusNode;
  TextEditingController? fechaEmisionTextController;
  String? Function(BuildContext, String?)? fechaEmisionTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    uniqueIDTextControllerValidator = _uniqueIDTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    buscarFocusNode?.dispose();
    buscarTextController?.dispose();

    uniqueIDFocusNode?.dispose();
    uniqueIDTextController?.dispose();

    fechaEmisionFocusNode?.dispose();
    fechaEmisionTextController?.dispose();
  }
}
