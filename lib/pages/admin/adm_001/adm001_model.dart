import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'adm001_widget.dart' show Adm001Widget;
import 'package:flutter/material.dart';

class Adm001Model extends FlutterFlowModel<Adm001Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    emailTextController?.dispose();

    textFieldFocusNode2?.dispose();
    passwordTextController?.dispose();
  }
}
