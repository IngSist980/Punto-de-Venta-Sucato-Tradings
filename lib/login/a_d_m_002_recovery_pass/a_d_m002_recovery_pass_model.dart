import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'a_d_m002_recovery_pass_widget.dart' show ADM002RecoveryPassWidget;
import 'package:flutter/material.dart';

class ADM002RecoveryPassModel
    extends FlutterFlowModel<ADM002RecoveryPassWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for mail widget.
  FocusNode? mailFocusNode;
  TextEditingController? mailTextController;
  String? Function(BuildContext, String?)? mailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    mailFocusNode?.dispose();
    mailTextController?.dispose();
  }
}
