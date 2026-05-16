import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'asignar_despachos_widget.dart' show AsignarDespachosWidget;
import 'package:flutter/material.dart';

class AsignarDespachosModel extends FlutterFlowModel<AsignarDespachosWidget> {
  ///  Local state fields for this component.

  DocumentReference? refRepartidor;

  RepartidorRecord? docRepartidor;

  List<RepartidorRutaStruct> horarioRepartidor = [];
  void addToHorarioRepartidor(RepartidorRutaStruct item) =>
      horarioRepartidor.add(item);
  void removeFromHorarioRepartidor(RepartidorRutaStruct item) =>
      horarioRepartidor.remove(item);
  void removeAtIndexFromHorarioRepartidor(int index) =>
      horarioRepartidor.removeAt(index);
  void insertAtIndexInHorarioRepartidor(int index, RepartidorRutaStruct item) =>
      horarioRepartidor.insert(index, item);
  void updateHorarioRepartidorAtIndex(
          int index, Function(RepartidorRutaStruct) updateFn) =>
      horarioRepartidor[index] = updateFn(horarioRepartidor[index]);

  String? diaSeleccionado;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Repartidor widget.
  String? repartidorValue;
  FormFieldController<String>? repartidorValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
