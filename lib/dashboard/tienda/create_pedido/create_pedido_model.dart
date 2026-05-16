import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'create_pedido_widget.dart' show CreatePedidoWidget;
import 'package:flutter/material.dart';

class CreatePedidoModel extends FlutterFlowModel<CreatePedidoWidget> {
  ///  Local state fields for this page.

  bool isPedido = false;

  int? descuento = 0;

  bool descuentoIsValido = false;

  double credito = 0.0;

  bool creditoIsValido = false;

  DocumentReference? refCliente;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  // State field(s) for nombreClienteF widget.
  FocusNode? nombreClienteFFocusNode;
  TextEditingController? nombreClienteFTextController;
  String? Function(BuildContext, String?)?
      nombreClienteFTextControllerValidator;
  // State field(s) for Direccion widget.
  FocusNode? direccionFocusNode;
  TextEditingController? direccionTextController;
  String? Function(BuildContext, String?)? direccionTextControllerValidator;
  String? _direccionTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Dirección entrega es requerido';
    }

    return null;
  }

  // State field(s) for DropDownPago widget.
  String? dropDownPagoValue;
  FormFieldController<String>? dropDownPagoValueController;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for descuento widget.
  FocusNode? descuentoFocusNode;
  TextEditingController? descuentoTextController;
  String? Function(BuildContext, String?)? descuentoTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  PromocionesDescuentosRecord? codigosList;
  // State field(s) for credito widget.
  FocusNode? creditoFocusNode;
  TextEditingController? creditoTextController;
  String? Function(BuildContext, String?)? creditoTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  CreditosDevolucionesRecord? creditosList;
  // State field(s) for NumeroOrden widget.
  FocusNode? numeroOrdenFocusNode;
  TextEditingController? numeroOrdenTextController;
  String? Function(BuildContext, String?)? numeroOrdenTextControllerValidator;
  // State field(s) for FechaEmision widget.
  FocusNode? fechaEmisionFocusNode;
  TextEditingController? fechaEmisionTextController;
  String? Function(BuildContext, String?)? fechaEmisionTextControllerValidator;
  // State field(s) for Estado widget.
  FocusNode? estadoFocusNode;
  TextEditingController? estadoTextController;
  String? Function(BuildContext, String?)? estadoTextControllerValidator;

  @override
  void initState(BuildContext context) {
    direccionTextControllerValidator = _direccionTextControllerValidator;
  }

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    nombreClienteFFocusNode?.dispose();
    nombreClienteFTextController?.dispose();

    direccionFocusNode?.dispose();
    direccionTextController?.dispose();

    descuentoFocusNode?.dispose();
    descuentoTextController?.dispose();

    creditoFocusNode?.dispose();
    creditoTextController?.dispose();

    numeroOrdenFocusNode?.dispose();
    numeroOrdenTextController?.dispose();

    fechaEmisionFocusNode?.dispose();
    fechaEmisionTextController?.dispose();

    estadoFocusNode?.dispose();
    estadoTextController?.dispose();
  }
}
