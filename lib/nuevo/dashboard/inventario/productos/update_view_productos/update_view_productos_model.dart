import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_view_productos_widget.dart' show UpdateViewProductosWidget;
import 'package:flutter/material.dart';

class UpdateViewProductosModel
    extends FlutterFlowModel<UpdateViewProductosWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadDataJq7 = false;
  FFUploadedFile uploadedLocalFile_uploadDataJq7 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataJq7 = '';

  // State field(s) for Estado widget.
  bool? estadoValue;
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  // State field(s) for SKU widget.
  FocusNode? skuFocusNode;
  TextEditingController? skuTextController;
  String? Function(BuildContext, String?)? skuTextControllerValidator;
  // State field(s) for descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  // State field(s) for Precio widget.
  FocusNode? precioFocusNode;
  TextEditingController? precioTextController;
  String? Function(BuildContext, String?)? precioTextControllerValidator;
  // State field(s) for Cantidad widget.
  FocusNode? cantidadFocusNode;
  TextEditingController? cantidadTextController;
  String? Function(BuildContext, String?)? cantidadTextControllerValidator;
  // State field(s) for Cantidad widget.
  int? cantidadValue;
  // State field(s) for DropDownCategoria widget.
  String? dropDownCategoriaValue;
  FormFieldController<String>? dropDownCategoriaValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    skuFocusNode?.dispose();
    skuTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();

    precioFocusNode?.dispose();
    precioTextController?.dispose();

    cantidadFocusNode?.dispose();
    cantidadTextController?.dispose();
  }
}
