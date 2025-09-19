import '/flutter_flow/flutter_flow_util.dart';
import '/nuevo/dashboard/dashboard/widget_builder/widget_builder_widget.dart';
import '/index.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  String moduloName = 'home';

  ///  State fields for stateful widgets in this page.

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
