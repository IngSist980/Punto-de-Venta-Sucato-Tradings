import '/flutter_flow/flutter_flow_util.dart';
import 'update_view_repartidor_widget.dart' show UpdateViewRepartidorWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UpdateViewRepartidorModel
    extends FlutterFlowModel<UpdateViewRepartidorWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Estado widget.
  bool? estadoValue;
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  String? _nombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'NombreRepartidor es requerido';
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
      return 'Telefono es requerido';
    }

    return null;
  }

  // State field(s) for Vehculotipo widget.
  FocusNode? vehculotipoFocusNode;
  TextEditingController? vehculotipoTextController;
  String? Function(BuildContext, String?)? vehculotipoTextControllerValidator;
  String? _vehculotipoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vehiculo es requerido';
    }

    return null;
  }

  // State field(s) for placa widget.
  FocusNode? placaFocusNode;
  TextEditingController? placaTextController;
  String? Function(BuildContext, String?)? placaTextControllerValidator;
  String? _placaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Placa es requerido';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nombreTextControllerValidator = _nombreTextControllerValidator;
    telefonoTextControllerValidator = _telefonoTextControllerValidator;
    vehculotipoTextControllerValidator = _vehculotipoTextControllerValidator;
    placaTextControllerValidator = _placaTextControllerValidator;
  }

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();

    vehculotipoFocusNode?.dispose();
    vehculotipoTextController?.dispose();

    placaFocusNode?.dispose();
    placaTextController?.dispose();
  }
}
