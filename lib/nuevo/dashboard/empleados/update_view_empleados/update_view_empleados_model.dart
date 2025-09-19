import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_view_empleados_widget.dart' show UpdateViewEmpleadosWidget;
import 'package:flutter/material.dart';

class UpdateViewEmpleadosModel
    extends FlutterFlowModel<UpdateViewEmpleadosWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadDataGl4 = false;
  FFUploadedFile uploadedLocalFile_uploadDataGl4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataGl4 = '';

  // State field(s) for Estado widget.
  bool? estadoValue;
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

  // State field(s) for creacion widget.
  FocusNode? creacionFocusNode;
  TextEditingController? creacionTextController;
  String? Function(BuildContext, String?)? creacionTextControllerValidator;
  // State field(s) for telefono widget.
  FocusNode? telefonoFocusNode;
  TextEditingController? telefonoTextController;
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;
  String? _telefonoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Teléfono de Contacto es requerido';
    }

    return null;
  }

  // State field(s) for DropDownRol widget.
  String? dropDownRolValue;
  FormFieldController<String>? dropDownRolValueController;

  @override
  void initState(BuildContext context) {
    nombreTextControllerValidator = _nombreTextControllerValidator;
    mailTextControllerValidator = _mailTextControllerValidator;
    telefonoTextControllerValidator = _telefonoTextControllerValidator;
  }

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    mailFocusNode?.dispose();
    mailTextController?.dispose();

    creacionFocusNode?.dispose();
    creacionTextController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();
  }
}
