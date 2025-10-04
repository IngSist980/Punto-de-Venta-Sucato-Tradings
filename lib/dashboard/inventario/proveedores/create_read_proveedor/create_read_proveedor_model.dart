import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_read_proveedor_widget.dart' show CreateReadProveedorWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateReadProveedorModel
    extends FlutterFlowModel<CreateReadProveedorWidget> {
  ///  Local state fields for this page.

  List<ProductosProveedoresStruct> productosQueReparte = [];
  void addToProductosQueReparte(ProductosProveedoresStruct item) =>
      productosQueReparte.add(item);
  void removeFromProductosQueReparte(ProductosProveedoresStruct item) =>
      productosQueReparte.remove(item);
  void removeAtIndexFromProductosQueReparte(int index) =>
      productosQueReparte.removeAt(index);
  void insertAtIndexInProductosQueReparte(
          int index, ProductosProveedoresStruct item) =>
      productosQueReparte.insert(index, item);
  void updateProductosQueReparteAtIndex(
          int index, Function(ProductosProveedoresStruct) updateFn) =>
      productosQueReparte[index] = updateFn(productosQueReparte[index]);

  bool verAgregarProducto = false;

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
  // State field(s) for Estado widget.
  bool? estadoValue;
  // State field(s) for Encargado widget.
  FocusNode? encargadoFocusNode;
  TextEditingController? encargadoTextController;
  String? Function(BuildContext, String?)? encargadoTextControllerValidator;
  String? _encargadoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nombre Proveedor  es requerido';
    }

    return null;
  }

  // State field(s) for nombreProveedor widget.
  FocusNode? nombreProveedorFocusNode;
  TextEditingController? nombreProveedorTextController;
  String? Function(BuildContext, String?)?
      nombreProveedorTextControllerValidator;
  String? _nombreProveedorTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nombre Proveedor es requerido';
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

  // State field(s) for Telefono widget.
  FocusNode? telefonoFocusNode;
  TextEditingController? telefonoTextController;
  late MaskTextInputFormatter telefonoMask;
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;
  String? _telefonoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Teléfono es requerido';
    }

    return null;
  }

  // State field(s) for producto widget.
  FocusNode? productoFocusNode;
  TextEditingController? productoTextController;
  String? Function(BuildContext, String?)? productoTextControllerValidator;
  // State field(s) for precio widget.
  FocusNode? precioFocusNode;
  TextEditingController? precioTextController;
  String? Function(BuildContext, String?)? precioTextControllerValidator;
  // State field(s) for CountControllerDias widget.
  int? countControllerDiasValue;
  // State field(s) for DropDownIntervalo widget.
  String? dropDownIntervaloValue;
  FormFieldController<String>? dropDownIntervaloValueController;

  @override
  void initState(BuildContext context) {
    encargadoTextControllerValidator = _encargadoTextControllerValidator;
    nombreProveedorTextControllerValidator =
        _nombreProveedorTextControllerValidator;
    mailTextControllerValidator = _mailTextControllerValidator;
    telefonoTextControllerValidator = _telefonoTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    buscarFocusNode?.dispose();
    buscarTextController?.dispose();

    encargadoFocusNode?.dispose();
    encargadoTextController?.dispose();

    nombreProveedorFocusNode?.dispose();
    nombreProveedorTextController?.dispose();

    mailFocusNode?.dispose();
    mailTextController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();

    productoFocusNode?.dispose();
    productoTextController?.dispose();

    precioFocusNode?.dispose();
    precioTextController?.dispose();
  }
}
