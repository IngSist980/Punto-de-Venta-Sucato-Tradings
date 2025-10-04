import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_read_i_kits_widget.dart' show CreateReadIKitsWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateReadIKitsModel extends FlutterFlowModel<CreateReadIKitsWidget> {
  ///  Local state fields for this page.

  int? caducidacValue;

  List<PaqueteStruct> productosDelKit = [];
  void addToProductosDelKit(PaqueteStruct item) => productosDelKit.add(item);
  void removeFromProductosDelKit(PaqueteStruct item) =>
      productosDelKit.remove(item);
  void removeAtIndexFromProductosDelKit(int index) =>
      productosDelKit.removeAt(index);
  void insertAtIndexInProductosDelKit(int index, PaqueteStruct item) =>
      productosDelKit.insert(index, item);
  void updateProductosDelKitAtIndex(
          int index, Function(PaqueteStruct) updateFn) =>
      productosDelKit[index] = updateFn(productosDelKit[index]);

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
  // State field(s) for DropDownEstado widget.
  bool? dropDownEstadoValue;
  FormFieldController<bool>? dropDownEstadoValueController;
  // State field(s) for DropDownCaducidad widget.
  String? dropDownCaducidadValue;
  FormFieldController<String>? dropDownCaducidadValueController;
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

  // State field(s) for PrecioNeto widget.
  FocusNode? precioNetoFocusNode;
  TextEditingController? precioNetoTextController;
  late MaskTextInputFormatter precioNetoMask;
  String? Function(BuildContext, String?)? precioNetoTextControllerValidator;
  // State field(s) for PrecioKit widget.
  FocusNode? precioKitFocusNode;
  TextEditingController? precioKitTextController;
  String? Function(BuildContext, String?)? precioKitTextControllerValidator;
  String? _precioKitTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Precio  es requerido';
    }

    return null;
  }

  // State field(s) for CaloriasTotales widget.
  FocusNode? caloriasTotalesFocusNode;
  TextEditingController? caloriasTotalesTextController;
  late MaskTextInputFormatter caloriasTotalesMask;
  String? Function(BuildContext, String?)?
      caloriasTotalesTextControllerValidator;
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

  @override
  void initState(BuildContext context) {
    nombreTextControllerValidator = _nombreTextControllerValidator;
    precioKitTextControllerValidator = _precioKitTextControllerValidator;
    caducidadTextControllerValidator = _caducidadTextControllerValidator;
    descripcionTextControllerValidator = _descripcionTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    buscarFocusNode?.dispose();
    buscarTextController?.dispose();

    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    precioNetoFocusNode?.dispose();
    precioNetoTextController?.dispose();

    precioKitFocusNode?.dispose();
    precioKitTextController?.dispose();

    caloriasTotalesFocusNode?.dispose();
    caloriasTotalesTextController?.dispose();

    caducidadFocusNode?.dispose();
    caducidadTextController?.dispose();

    skuFocusNode?.dispose();
    skuTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();
  }
}
