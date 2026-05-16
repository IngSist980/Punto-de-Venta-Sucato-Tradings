import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_read_repartidor_widget.dart' show CreateReadRepartidorWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateReadRepartidorModel
    extends FlutterFlowModel<CreateReadRepartidorWidget> {
  ///  Local state fields for this page.

  List<RepartidorRutaStruct> horario = [];
  void addToHorario(RepartidorRutaStruct item) => horario.add(item);
  void removeFromHorario(RepartidorRutaStruct item) => horario.remove(item);
  void removeAtIndexFromHorario(int index) => horario.removeAt(index);
  void insertAtIndexInHorario(int index, RepartidorRutaStruct item) =>
      horario.insert(index, item);
  void updateHorarioAtIndex(
          int index, Function(RepartidorRutaStruct) updateFn) =>
      horario[index] = updateFn(horario[index]);

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
  // State field(s) for Nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  String? _nombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nombre Proveedor es requerido';
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
      return 'Teléfono es requerido';
    }

    return null;
  }

  // State field(s) for VehiculoTipo widget.
  FocusNode? vehiculoTipoFocusNode;
  TextEditingController? vehiculoTipoTextController;
  String? Function(BuildContext, String?)? vehiculoTipoTextControllerValidator;
  String? _vehiculoTipoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vehículo es requerido';
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
    vehiculoTipoTextControllerValidator = _vehiculoTipoTextControllerValidator;
    placaTextControllerValidator = _placaTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    buscarFocusNode?.dispose();
    buscarTextController?.dispose();

    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();

    vehiculoTipoFocusNode?.dispose();
    vehiculoTipoTextController?.dispose();

    placaFocusNode?.dispose();
    placaTextController?.dispose();
  }
}
