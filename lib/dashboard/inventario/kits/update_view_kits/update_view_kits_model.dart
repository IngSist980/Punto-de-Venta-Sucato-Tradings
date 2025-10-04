import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_view_kits_widget.dart' show UpdateViewKitsWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UpdateViewKitsModel extends FlutterFlowModel<UpdateViewKitsWidget> {
  ///  Local state fields for this component.

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

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Estado widget.
  bool? estadoValue;
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  // State field(s) for PrecioNeto widget.
  FocusNode? precioNetoFocusNode;
  TextEditingController? precioNetoTextController;
  late MaskTextInputFormatter precioNetoMask;
  String? Function(BuildContext, String?)? precioNetoTextControllerValidator;
  // State field(s) for PrecioKit widget.
  FocusNode? precioKitFocusNode;
  TextEditingController? precioKitTextController;
  String? Function(BuildContext, String?)? precioKitTextControllerValidator;
  // State field(s) for carloriasTotales widget.
  FocusNode? carloriasTotalesFocusNode;
  TextEditingController? carloriasTotalesTextController;
  String? Function(BuildContext, String?)?
      carloriasTotalesTextControllerValidator;
  // State field(s) for caducidad widget.
  FocusNode? caducidadFocusNode;
  TextEditingController? caducidadTextController;
  String? Function(BuildContext, String?)? caducidadTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for SKU widget.
  FocusNode? skuFocusNode;
  TextEditingController? skuTextController;
  String? Function(BuildContext, String?)? skuTextControllerValidator;
  // State field(s) for descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    precioNetoFocusNode?.dispose();
    precioNetoTextController?.dispose();

    precioKitFocusNode?.dispose();
    precioKitTextController?.dispose();

    carloriasTotalesFocusNode?.dispose();
    carloriasTotalesTextController?.dispose();

    caducidadFocusNode?.dispose();
    caducidadTextController?.dispose();

    skuFocusNode?.dispose();
    skuTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();
  }
}
