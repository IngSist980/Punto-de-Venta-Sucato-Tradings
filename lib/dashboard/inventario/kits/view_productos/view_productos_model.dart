import '/flutter_flow/flutter_flow_util.dart';
import 'view_productos_widget.dart' show ViewProductosWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ViewProductosModel extends FlutterFlowModel<ViewProductosWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  // State field(s) for Calorias widget.
  FocusNode? caloriasFocusNode;
  TextEditingController? caloriasTextController;
  late MaskTextInputFormatter caloriasMask;
  String? Function(BuildContext, String?)? caloriasTextControllerValidator;
  // State field(s) for caducidad widget.
  FocusNode? caducidadFocusNode;
  TextEditingController? caducidadTextController;
  String? Function(BuildContext, String?)? caducidadTextControllerValidator;
  // State field(s) for SKU widget.
  FocusNode? skuFocusNode;
  TextEditingController? skuTextController;
  String? Function(BuildContext, String?)? skuTextControllerValidator;
  // State field(s) for descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  // State field(s) for Precio widget.
  FocusNode? precioFocusNode;
  TextEditingController? precioTextController;
  String? Function(BuildContext, String?)? precioTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    caloriasFocusNode?.dispose();
    caloriasTextController?.dispose();

    caducidadFocusNode?.dispose();
    caducidadTextController?.dispose();

    skuFocusNode?.dispose();
    skuTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();

    precioFocusNode?.dispose();
    precioTextController?.dispose();
  }
}
