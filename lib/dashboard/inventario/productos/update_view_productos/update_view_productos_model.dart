import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_view_productos_widget.dart' show UpdateViewProductosWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UpdateViewProductosModel
    extends FlutterFlowModel<UpdateViewProductosWidget> {
  ///  Local state fields for this component.

  DocumentReference? proveedorRef;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadDataJq7 = false;
  FFUploadedFile uploadedLocalFile_uploadDataJq7 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataJq7 = '';

  // State field(s) for Estado widget.
  bool? estadoValue;
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  String? _nombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nombre es requerido';
    }

    return null;
  }

  // State field(s) for Calorias widget.
  FocusNode? caloriasFocusNode;
  TextEditingController? caloriasTextController;
  late MaskTextInputFormatter caloriasMask;
  String? Function(BuildContext, String?)? caloriasTextControllerValidator;
  String? _caloriasTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Calorias  es requerido';
    }

    return null;
  }

  // State field(s) for Lote widget.
  FocusNode? loteFocusNode;
  TextEditingController? loteTextController;
  late MaskTextInputFormatter loteMask;
  String? Function(BuildContext, String?)? loteTextControllerValidator;
  // State field(s) for caducidad widget.
  FocusNode? caducidadFocusNode;
  TextEditingController? caducidadTextController;
  String? Function(BuildContext, String?)? caducidadTextControllerValidator;
  String? _caducidadTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Fecha Caducidad  es requerido';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for SKU widget.
  FocusNode? skuFocusNode;
  TextEditingController? skuTextController;
  String? Function(BuildContext, String?)? skuTextControllerValidator;
  // State field(s) for descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  String? _descripcionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Descripcion  es requerido';
    }

    return null;
  }

  // State field(s) for Precio widget.
  FocusNode? precioFocusNode;
  TextEditingController? precioTextController;
  String? Function(BuildContext, String?)? precioTextControllerValidator;
  String? _precioTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Precio  es requerido';
    }

    return null;
  }

  // State field(s) for Cantidad widget.
  FocusNode? cantidadFocusNode;
  TextEditingController? cantidadTextController;
  String? Function(BuildContext, String?)? cantidadTextControllerValidator;
  String? _cantidadTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Cantidad  es requerido';
    }

    return null;
  }

  // State field(s) for CantidadCounter widget.
  int? cantidadCounterValue;
  // State field(s) for DropDownCategoria widget.
  String? dropDownCategoriaValue;
  FormFieldController<String>? dropDownCategoriaValueController;
  // State field(s) for DropDownProveedor widget.
  String? dropDownProveedorValue;
  FormFieldController<String>? dropDownProveedorValueController;
  // State field(s) for ComentarioAjuste widget.
  FocusNode? comentarioAjusteFocusNode;
  TextEditingController? comentarioAjusteTextController;
  String? Function(BuildContext, String?)?
      comentarioAjusteTextControllerValidator;
  String? _comentarioAjusteTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Comentario  es requerido';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nombreTextControllerValidator = _nombreTextControllerValidator;
    caloriasTextControllerValidator = _caloriasTextControllerValidator;
    caducidadTextControllerValidator = _caducidadTextControllerValidator;
    descripcionTextControllerValidator = _descripcionTextControllerValidator;
    precioTextControllerValidator = _precioTextControllerValidator;
    cantidadTextControllerValidator = _cantidadTextControllerValidator;
    comentarioAjusteTextControllerValidator =
        _comentarioAjusteTextControllerValidator;
  }

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    caloriasFocusNode?.dispose();
    caloriasTextController?.dispose();

    loteFocusNode?.dispose();
    loteTextController?.dispose();

    caducidadFocusNode?.dispose();
    caducidadTextController?.dispose();

    skuFocusNode?.dispose();
    skuTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();

    precioFocusNode?.dispose();
    precioTextController?.dispose();

    cantidadFocusNode?.dispose();
    cantidadTextController?.dispose();

    comentarioAjusteFocusNode?.dispose();
    comentarioAjusteTextController?.dispose();
  }
}
