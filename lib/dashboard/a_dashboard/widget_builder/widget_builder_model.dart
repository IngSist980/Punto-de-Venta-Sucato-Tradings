import '/dashboard/a_dashboard/home_menu/home_menu_widget.dart';
import '/dashboard/a_dashboard/inventario_menu/inventario_menu_widget.dart';
import '/dashboard/a_dashboard/ordenes_menu/ordenes_menu_widget.dart';
import '/dashboard/a_dashboard/reporteria_menu/reporteria_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'widget_builder_widget.dart' show WidgetBuilderWidget;
import 'package:flutter/material.dart';

class WidgetBuilderModel extends FlutterFlowModel<WidgetBuilderWidget> {
  ///  Local state fields for this component.

  String moduloAVer = 'home';

  ///  State fields for stateful widgets in this component.

  // Model for HomeMenu component.
  late HomeMenuModel homeMenuModel;
  // Model for InventarioMenu component.
  late InventarioMenuModel inventarioMenuModel;
  // Model for OrdenesMenu component.
  late OrdenesMenuModel ordenesMenuModel;
  // Model for ReporteriaMenu component.
  late ReporteriaMenuModel reporteriaMenuModel;

  @override
  void initState(BuildContext context) {
    homeMenuModel = createModel(context, () => HomeMenuModel());
    inventarioMenuModel = createModel(context, () => InventarioMenuModel());
    ordenesMenuModel = createModel(context, () => OrdenesMenuModel());
    reporteriaMenuModel = createModel(context, () => ReporteriaMenuModel());
  }

  @override
  void dispose() {
    homeMenuModel.dispose();
    inventarioMenuModel.dispose();
    ordenesMenuModel.dispose();
    reporteriaMenuModel.dispose();
  }
}
