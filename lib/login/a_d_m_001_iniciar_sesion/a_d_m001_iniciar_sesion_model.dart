import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'a_d_m001_iniciar_sesion_widget.dart' show ADM001IniciarSesionWidget;
import 'package:flutter/material.dart';

class ADM001IniciarSesionModel
    extends FlutterFlowModel<ADM001IniciarSesionWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for correo widget.
  FocusNode? correoFocusNode;
  TextEditingController? correoTextController;
  String? Function(BuildContext, String?)? correoTextControllerValidator;
  String? _correoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Usuario es requerido';
    }

    return null;
  }

  // State field(s) for pass widget.
  FocusNode? passFocusNode;
  TextEditingController? passTextController;
  late bool passVisibility;
  String? Function(BuildContext, String?)? passTextControllerValidator;
  String? _passTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Contraseña es requerido';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    correoTextControllerValidator = _correoTextControllerValidator;
    passVisibility = false;
    passTextControllerValidator = _passTextControllerValidator;
  }

  @override
  void dispose() {
    correoFocusNode?.dispose();
    correoTextController?.dispose();

    passFocusNode?.dispose();
    passTextController?.dispose();
  }
}
