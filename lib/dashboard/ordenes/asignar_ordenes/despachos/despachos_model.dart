import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'despachos_widget.dart' show DespachosWidget;
import 'package:flutter/material.dart';

class DespachosModel extends FlutterFlowModel<DespachosWidget> {
  ///  Local state fields for this page.

  String estadoOrden = 'Completado';

  ///  State fields for stateful widgets in this page.

  // State field(s) for buscar widget.
  FocusNode? buscarFocusNode;
  TextEditingController? buscarTextController;
  String? Function(BuildContext, String?)? buscarTextControllerValidator;
  // State field(s) for DropDownDespachado widget.
  bool? dropDownDespachadoValue;
  FormFieldController<bool>? dropDownDespachadoValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    buscarFocusNode?.dispose();
    buscarTextController?.dispose();
  }
}
