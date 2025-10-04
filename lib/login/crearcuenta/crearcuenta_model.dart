import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'crearcuenta_widget.dart' show CrearcuentaWidget;
import 'package:flutter/material.dart';

class CrearcuentaModel extends FlutterFlowModel<CrearcuentaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  String? _nombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Usuario es requerido';
    }

    return null;
  }

  // State field(s) for telefono widget.
  FocusNode? telefonoFocusNode;
  TextEditingController? telefonoTextController;
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;
  String? _telefonoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Teléfono es requerido';
    }

    return null;
  }

  // State field(s) for mail widget.
  FocusNode? mailFocusNode;
  TextEditingController? mailTextController;
  String? Function(BuildContext, String?)? mailTextControllerValidator;
  String? _mailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Correo es requerido';
    }

    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Contraseña es requerido';
    }

    if (!RegExp('/^(?=.*[A-Za-z])(?=.*\\d)(?=.*[\\s\\W]).{12,18}\$/')
        .hasMatch(val)) {
      return 'Mínimo de 12, máximo 18 ';
    }
    return null;
  }

  // State field(s) for Repassword widget.
  FocusNode? repasswordFocusNode;
  TextEditingController? repasswordTextController;
  late bool repasswordVisibility;
  String? Function(BuildContext, String?)? repasswordTextControllerValidator;
  String? _repasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Contraseña es requerido';
    }

    if (!RegExp('/^(?=.*[A-Za-z])(?=.*\\d)(?=.*[\\s\\W]).{12,18}\$/')
        .hasMatch(val)) {
      return 'Mínimo de 12, máximo 18 ';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    nombreTextControllerValidator = _nombreTextControllerValidator;
    telefonoTextControllerValidator = _telefonoTextControllerValidator;
    mailTextControllerValidator = _mailTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    repasswordVisibility = false;
    repasswordTextControllerValidator = _repasswordTextControllerValidator;
  }

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();

    mailFocusNode?.dispose();
    mailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    repasswordFocusNode?.dispose();
    repasswordTextController?.dispose();
  }
}
