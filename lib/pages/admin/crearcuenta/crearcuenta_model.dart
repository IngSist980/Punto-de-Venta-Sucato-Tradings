import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'crearcuenta_widget.dart' show CrearcuentaWidget;
import 'package:flutter/material.dart';

class CrearcuentaModel extends FlutterFlowModel<CrearcuentaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldcorreo widget.
  FocusNode? textFieldcorreoFocusNode;
  TextEditingController? textFieldcorreoTextController;
  String? Function(BuildContext, String?)?
      textFieldcorreoTextControllerValidator;
  // State field(s) for TextFieldcontra widget.
  FocusNode? textFieldcontraFocusNode;
  TextEditingController? textFieldcontraTextController;
  late bool textFieldcontraVisibility;
  String? Function(BuildContext, String?)?
      textFieldcontraTextControllerValidator;

  @override
  void initState(BuildContext context) {
    textFieldcontraVisibility = false;
  }

  @override
  void dispose() {
    textFieldcorreoFocusNode?.dispose();
    textFieldcorreoTextController?.dispose();

    textFieldcontraFocusNode?.dispose();
    textFieldcontraTextController?.dispose();
  }
}
