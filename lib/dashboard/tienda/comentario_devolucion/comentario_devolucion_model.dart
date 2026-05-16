import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comentario_devolucion_widget.dart' show ComentarioDevolucionWidget;
import 'package:flutter/material.dart';

class ComentarioDevolucionModel
    extends FlutterFlowModel<ComentarioDevolucionWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ComentarioOrden widget.
  FocusNode? comentarioOrdenFocusNode;
  TextEditingController? comentarioOrdenTextController;
  String? Function(BuildContext, String?)?
      comentarioOrdenTextControllerValidator;
  String? _comentarioOrdenTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Comentario es requerido';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DevolucionesRecord? devolucionCreada;

  @override
  void initState(BuildContext context) {
    comentarioOrdenTextControllerValidator =
        _comentarioOrdenTextControllerValidator;
  }

  @override
  void dispose() {
    comentarioOrdenFocusNode?.dispose();
    comentarioOrdenTextController?.dispose();
  }
}
