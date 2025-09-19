import '/flutter_flow/flutter_flow_util.dart';
import 'update_view_proveedor_widget.dart' show UpdateViewProveedorWidget;
import 'package:flutter/material.dart';

class UpdateViewProveedorModel
    extends FlutterFlowModel<UpdateViewProveedorWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Estado widget.
  bool? estadoValue;
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();
  }
}
