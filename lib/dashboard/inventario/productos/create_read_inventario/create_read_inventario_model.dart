import '/dashboard/inventario/productos/ver_descripcion/ver_descripcion_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_read_inventario_widget.dart' show CreateReadInventarioWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateReadInventarioModel
    extends FlutterFlowModel<CreateReadInventarioWidget> {
  ///  Local state fields for this page.

  DocumentReference? proveedorRef;

  int? caducidacValue;

  bool verDescripcion = false;

  DocumentReference? refProductoAVerDesc;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for buscar widget.
  FocusNode? buscarFocusNode;
  TextEditingController? buscarTextController;
  String? Function(BuildContext, String?)? buscarTextControllerValidator;
  // State field(s) for DropDownCategoriafiltro widget.
  String? dropDownCategoriafiltroValue;
  FormFieldController<String>? dropDownCategoriafiltroValueController;
  // State field(s) for DropDownEstado widget.
  bool? dropDownEstadoValue;
  FormFieldController<bool>? dropDownEstadoValueController;
  // State field(s) for DropDownCaducidad widget.
  String? dropDownCaducidadValue;
  FormFieldController<String>? dropDownCaducidadValueController;
  // Models for verDescripcion dynamic component.
  late FlutterFlowDynamicModels<VerDescripcionModel> verDescripcionModels;
  bool isDataUploading_uploadDataVqa = false;
  FFUploadedFile uploadedLocalFile_uploadDataVqa =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataVqa = '';

  // State field(s) for Estado widget.
  bool? estadoValue;
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  String? _nombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nombre Completo es requerido';
    }

    return null;
  }

  // State field(s) for Calorias widget.
  FocusNode? caloriasFocusNode;
  TextEditingController? caloriasTextController;
  String? Function(BuildContext, String?)? caloriasTextControllerValidator;
  String? _caloriasTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Calorias es requerido';
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
      return 'Fecha Caducidad es requerido';
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
      return 'Teléfono es requerido';
    }

    return null;
  }

  // State field(s) for DropDownCategoria widget.
  String? dropDownCategoriaValue;
  FormFieldController<String>? dropDownCategoriaValueController;
  // State field(s) for DropDownProveedor widget.
  String? dropDownProveedorValue;
  FormFieldController<String>? dropDownProveedorValueController;
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

  // State field(s) for CountControllerCantidad widget.
  int? countControllerCantidadValue;

  @override
  void initState(BuildContext context) {
    verDescripcionModels =
        FlutterFlowDynamicModels(() => VerDescripcionModel());
    nombreTextControllerValidator = _nombreTextControllerValidator;
    caloriasTextControllerValidator = _caloriasTextControllerValidator;
    caducidadTextControllerValidator = _caducidadTextControllerValidator;
    descripcionTextControllerValidator = _descripcionTextControllerValidator;
    precioTextControllerValidator = _precioTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    buscarFocusNode?.dispose();
    buscarTextController?.dispose();

    verDescripcionModels.dispose();
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
  }
}
