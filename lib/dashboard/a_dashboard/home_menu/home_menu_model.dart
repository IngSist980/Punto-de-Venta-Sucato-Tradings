import '/flutter_flow/flutter_flow_util.dart';
import 'home_menu_widget.dart' show HomeMenuWidget;
import 'package:flutter/material.dart';

class HomeMenuModel extends FlutterFlowModel<HomeMenuWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for codigo widget.
  FocusNode? codigoFocusNode;
  TextEditingController? codigoTextController;
  String? Function(BuildContext, String?)? codigoTextControllerValidator;
  String? _codigoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Código... es requerido';
    }

    return null;
  }

  // State field(s) for descuento widget.
  FocusNode? descuentoFocusNode;
  TextEditingController? descuentoTextController;
  String? Function(BuildContext, String?)? descuentoTextControllerValidator;
  String? _descuentoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Descuento... es requerido';
    }

    return null;
  }

  // State field(s) for uso widget.
  bool? usoValue;

  @override
  void initState(BuildContext context) {
    codigoTextControllerValidator = _codigoTextControllerValidator;
    descuentoTextControllerValidator = _descuentoTextControllerValidator;
  }

  @override
  void dispose() {
    codigoFocusNode?.dispose();
    codigoTextController?.dispose();

    descuentoFocusNode?.dispose();
    descuentoTextController?.dispose();
  }
}
