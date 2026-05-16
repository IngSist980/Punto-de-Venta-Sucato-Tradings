import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'read_devoluciones_widget.dart' show ReadDevolucionesWidget;
import 'package:flutter/material.dart';

class ReadDevolucionesModel extends FlutterFlowModel<ReadDevolucionesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for buscar widget.
  FocusNode? buscarFocusNode;
  TextEditingController? buscarTextController;
  String? Function(BuildContext, String?)? buscarTextControllerValidator;
  // State field(s) for DropDownEstado widget.
  bool? dropDownEstadoValue;
  FormFieldController<bool>? dropDownEstadoValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    buscarFocusNode?.dispose();
    buscarTextController?.dispose();
  }
}
