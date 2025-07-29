import '/flutter_flow/flutter_flow_util.dart';
import 'inv005_widget.dart' show Inv005Widget;
import 'package:flutter/material.dart';

class Inv005Model extends FlutterFlowModel<Inv005Widget> {
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
