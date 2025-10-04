import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'factura_widget.dart' show FacturaWidget;
import 'package:flutter/material.dart';

class FacturaModel extends FlutterFlowModel<FacturaWidget> {
  ///  Local state fields for this page.

  bool isPedido = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  // State field(s) for Direccion widget.
  FocusNode? direccionFocusNode;
  TextEditingController? direccionTextController;
  String? Function(BuildContext, String?)? direccionTextControllerValidator;
  // State field(s) for Repartidor widget.
  FocusNode? repartidorFocusNode;
  TextEditingController? repartidorTextController;
  String? Function(BuildContext, String?)? repartidorTextControllerValidator;
  // State field(s) for diaDeReparto widget.
  FocusNode? diaDeRepartoFocusNode;
  TextEditingController? diaDeRepartoTextController;
  String? Function(BuildContext, String?)? diaDeRepartoTextControllerValidator;
  // State field(s) for NumeroOrden widget.
  FocusNode? numeroOrdenFocusNode;
  TextEditingController? numeroOrdenTextController;
  String? Function(BuildContext, String?)? numeroOrdenTextControllerValidator;
  // State field(s) for FechaEmision widget.
  FocusNode? fechaEmisionFocusNode;
  TextEditingController? fechaEmisionTextController;
  String? Function(BuildContext, String?)? fechaEmisionTextControllerValidator;
  // State field(s) for Estado widget.
  FocusNode? estadoFocusNode;
  TextEditingController? estadoTextController;
  String? Function(BuildContext, String?)? estadoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    direccionFocusNode?.dispose();
    direccionTextController?.dispose();

    repartidorFocusNode?.dispose();
    repartidorTextController?.dispose();

    diaDeRepartoFocusNode?.dispose();
    diaDeRepartoTextController?.dispose();

    numeroOrdenFocusNode?.dispose();
    numeroOrdenTextController?.dispose();

    fechaEmisionFocusNode?.dispose();
    fechaEmisionTextController?.dispose();

    estadoFocusNode?.dispose();
    estadoTextController?.dispose();
  }
}
