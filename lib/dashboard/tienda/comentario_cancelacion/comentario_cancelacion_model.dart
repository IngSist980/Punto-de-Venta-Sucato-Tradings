import '/flutter_flow/flutter_flow_util.dart';
import 'comentario_cancelacion_widget.dart' show ComentarioCancelacionWidget;
import 'package:flutter/material.dart';

class ComentarioCancelacionModel
    extends FlutterFlowModel<ComentarioCancelacionWidget> {
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
