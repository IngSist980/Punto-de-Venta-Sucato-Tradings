import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_view_cliente_widget.dart' show UpdateViewClienteWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UpdateViewClienteModel extends FlutterFlowModel<UpdateViewClienteWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  String? _nombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nombre de Contacto es requerido';
    }

    return null;
  }

  // State field(s) for Code widget.
  FocusNode? codeFocusNode;
  TextEditingController? codeTextController;
  String? Function(BuildContext, String?)? codeTextControllerValidator;
  // State field(s) for social widget.
  FocusNode? socialFocusNode;
  TextEditingController? socialTextController;
  String? Function(BuildContext, String?)? socialTextControllerValidator;
  String? _socialTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Razón Social es requerido';
    }

    return null;
  }

  // State field(s) for direccion widget.
  FocusNode? direccionFocusNode;
  TextEditingController? direccionTextController;
  String? Function(BuildContext, String?)? direccionTextControllerValidator;
  String? _direccionTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Dirección es requerido';
    }

    return null;
  }

  // State field(s) for juridica widget.
  FocusNode? juridicaFocusNode;
  TextEditingController? juridicaTextController;
  String? Function(BuildContext, String?)? juridicaTextControllerValidator;
  String? _juridicaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Cédula Jurídica es requerido';
    }

    return null;
  }

  // State field(s) for telefono widget.
  FocusNode? telefonoFocusNode;
  TextEditingController? telefonoTextController;
  late MaskTextInputFormatter telefonoMask;
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;
  String? _telefonoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Teléfono de Contacto es requerido';
    }

    return null;
  }

  // State field(s) for telefono2 widget.
  FocusNode? telefono2FocusNode;
  TextEditingController? telefono2TextController;
  late MaskTextInputFormatter telefono2Mask;
  String? Function(BuildContext, String?)? telefono2TextControllerValidator;
  // State field(s) for DropDownCategoria widget.
  String? dropDownCategoriaValue;
  FormFieldController<String>? dropDownCategoriaValueController;

  @override
  void initState(BuildContext context) {
    nombreTextControllerValidator = _nombreTextControllerValidator;
    socialTextControllerValidator = _socialTextControllerValidator;
    direccionTextControllerValidator = _direccionTextControllerValidator;
    juridicaTextControllerValidator = _juridicaTextControllerValidator;
    telefonoTextControllerValidator = _telefonoTextControllerValidator;
  }

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    codeFocusNode?.dispose();
    codeTextController?.dispose();

    socialFocusNode?.dispose();
    socialTextController?.dispose();

    direccionFocusNode?.dispose();
    direccionTextController?.dispose();

    juridicaFocusNode?.dispose();
    juridicaTextController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();

    telefono2FocusNode?.dispose();
    telefono2TextController?.dispose();
  }
}
