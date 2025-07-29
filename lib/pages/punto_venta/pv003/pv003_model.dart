import '/flutter_flow/flutter_flow_util.dart';
import 'pv003_widget.dart' show Pv003Widget;
import 'package:flutter/material.dart';

class Pv003Model extends FlutterFlowModel<Pv003Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
