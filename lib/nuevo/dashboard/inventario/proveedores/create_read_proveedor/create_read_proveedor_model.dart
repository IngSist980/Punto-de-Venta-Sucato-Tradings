import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_read_proveedor_widget.dart' show CreateReadProveedorWidget;
import 'package:flutter/material.dart';

class CreateReadProveedorModel
    extends FlutterFlowModel<CreateReadProveedorWidget> {
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
  // State field(s) for nombreProveedor widget.
  FocusNode? nombreProveedorFocusNode;
  TextEditingController? nombreProveedorTextController;
  String? Function(BuildContext, String?)?
      nombreProveedorTextControllerValidator;
  String? _nombreProveedorTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nombre Proveedor  es requerido';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nombreProveedorTextControllerValidator =
        _nombreProveedorTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    buscarFocusNode?.dispose();
    buscarTextController?.dispose();

    nombreProveedorFocusNode?.dispose();
    nombreProveedorTextController?.dispose();
  }
}
