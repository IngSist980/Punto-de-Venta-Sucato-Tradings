import '/backend/backend.dart';
import '/dashboard/a_dashboard/widget_builder/widget_builder_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Dashboard widget.
  AjustesAppRecord? ajustes;
  // Stores action output result for [Firestore Query - Query a collection] action in Dashboard widget.
  int? listaOrdenes;
  // Model for WidgetBuilder component.
  late WidgetBuilderModel widgetBuilderModel;

  @override
  void initState(BuildContext context) {
    widgetBuilderModel = createModel(context, () => WidgetBuilderModel());
  }

  @override
  void dispose() {
    widgetBuilderModel.dispose();
  }
}
