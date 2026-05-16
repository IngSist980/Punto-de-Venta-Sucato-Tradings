import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'read_pedidos_widget.dart' show ReadPedidosWidget;
import 'package:flutter/material.dart';

class ReadPedidosModel extends FlutterFlowModel<ReadPedidosWidget> {
  ///  Local state fields for this page.

  int? caducidacValue;

  List<PaqueteStruct> productosDelKit = [];
  void addToProductosDelKit(PaqueteStruct item) => productosDelKit.add(item);
  void removeFromProductosDelKit(PaqueteStruct item) =>
      productosDelKit.remove(item);
  void removeAtIndexFromProductosDelKit(int index) =>
      productosDelKit.removeAt(index);
  void insertAtIndexInProductosDelKit(int index, PaqueteStruct item) =>
      productosDelKit.insert(index, item);
  void updateProductosDelKitAtIndex(
          int index, Function(PaqueteStruct) updateFn) =>
      productosDelKit[index] = updateFn(productosDelKit[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for buscar widget.
  FocusNode? buscarFocusNode;
  TextEditingController? buscarTextController;
  String? Function(BuildContext, String?)? buscarTextControllerValidator;
  // State field(s) for DropDownEstado widget.
  String? dropDownEstadoValue;
  FormFieldController<String>? dropDownEstadoValueController;
  // Stores action output result for [Custom Action - updateProductos] action in IconButton widget.
  bool? reduceProductos;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    buscarFocusNode?.dispose();
    buscarTextController?.dispose();
  }
}
