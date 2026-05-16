import '/flutter_flow/flutter_flow_util.dart';
import 'vista_rapida_credito_widget.dart' show VistaRapidaCreditoWidget;
import 'package:flutter/material.dart';

class VistaRapidaCreditoModel
    extends FlutterFlowModel<VistaRapidaCreditoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  // State field(s) for orden widget.
  FocusNode? ordenFocusNode;
  TextEditingController? ordenTextController;
  String? Function(BuildContext, String?)? ordenTextControllerValidator;
  // State field(s) for fechaVente widget.
  FocusNode? fechaVenteFocusNode;
  TextEditingController? fechaVenteTextController;
  String? Function(BuildContext, String?)? fechaVenteTextControllerValidator;
  // State field(s) for emision widget.
  FocusNode? emisionFocusNode;
  TextEditingController? emisionTextController;
  String? Function(BuildContext, String?)? emisionTextControllerValidator;
  // State field(s) for pagado widget.
  FocusNode? pagadoFocusNode;
  TextEditingController? pagadoTextController;
  String? Function(BuildContext, String?)? pagadoTextControllerValidator;
  // State field(s) for cantProdutos widget.
  FocusNode? cantProdutosFocusNode;
  TextEditingController? cantProdutosTextController;
  String? Function(BuildContext, String?)? cantProdutosTextControllerValidator;
  // State field(s) for Codigo widget.
  FocusNode? codigoFocusNode;
  TextEditingController? codigoTextController;
  String? Function(BuildContext, String?)? codigoTextControllerValidator;
  // State field(s) for credito widget.
  FocusNode? creditoFocusNode;
  TextEditingController? creditoTextController;
  String? Function(BuildContext, String?)? creditoTextControllerValidator;
  // State field(s) for Estado widget.
  FocusNode? estadoFocusNode;
  TextEditingController? estadoTextController;
  String? Function(BuildContext, String?)? estadoTextControllerValidator;
  // State field(s) for canjeadoEl widget.
  FocusNode? canjeadoElFocusNode;
  TextEditingController? canjeadoElTextController;
  String? Function(BuildContext, String?)? canjeadoElTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    ordenFocusNode?.dispose();
    ordenTextController?.dispose();

    fechaVenteFocusNode?.dispose();
    fechaVenteTextController?.dispose();

    emisionFocusNode?.dispose();
    emisionTextController?.dispose();

    pagadoFocusNode?.dispose();
    pagadoTextController?.dispose();

    cantProdutosFocusNode?.dispose();
    cantProdutosTextController?.dispose();

    codigoFocusNode?.dispose();
    codigoTextController?.dispose();

    creditoFocusNode?.dispose();
    creditoTextController?.dispose();

    estadoFocusNode?.dispose();
    estadoTextController?.dispose();

    canjeadoElFocusNode?.dispose();
    canjeadoElTextController?.dispose();
  }
}
