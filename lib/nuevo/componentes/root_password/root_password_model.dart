import '/flutter_flow/flutter_flow_util.dart';
import 'root_password_widget.dart' show RootPasswordWidget;
import 'package:flutter/material.dart';

class RootPasswordModel extends FlutterFlowModel<RootPasswordWidget> {
  ///  Local state fields for this component.

  bool incorrecto = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
