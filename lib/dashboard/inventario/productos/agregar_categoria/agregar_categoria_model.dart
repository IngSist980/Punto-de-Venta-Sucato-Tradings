import '/flutter_flow/flutter_flow_util.dart';
import 'agregar_categoria_widget.dart' show AgregarCategoriaWidget;
import 'package:flutter/material.dart';

class AgregarCategoriaModel extends FlutterFlowModel<AgregarCategoriaWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Cat widget.
  FocusNode? catFocusNode;
  TextEditingController? catTextController;
  String? Function(BuildContext, String?)? catTextControllerValidator;
  String? _catTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Categoría es requerida';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    catTextControllerValidator = _catTextControllerValidator;
  }

  @override
  void dispose() {
    catFocusNode?.dispose();
    catTextController?.dispose();
  }
}
