import '/flutter_flow/flutter_flow_util.dart';
import 'list_cliente_frecuentes_widget.dart' show ListClienteFrecuentesWidget;
import 'package:flutter/material.dart';

class ListClienteFrecuentesModel
    extends FlutterFlowModel<ListClienteFrecuentesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for buscar widget.
  FocusNode? buscarFocusNode;
  TextEditingController? buscarTextController;
  String? Function(BuildContext, String?)? buscarTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    buscarFocusNode?.dispose();
    buscarTextController?.dispose();
  }
}
