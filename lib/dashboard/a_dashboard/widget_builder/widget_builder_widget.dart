import '/dashboard/a_dashboard/home_menu/home_menu_widget.dart';
import '/dashboard/a_dashboard/inventario_menu/inventario_menu_widget.dart';
import '/dashboard/a_dashboard/ordenes_menu/ordenes_menu_widget.dart';
import '/dashboard/a_dashboard/reporteria_menu/reporteria_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'widget_builder_model.dart';
export 'widget_builder_model.dart';

class WidgetBuilderWidget extends StatefulWidget {
  const WidgetBuilderWidget({
    super.key,
    required this.refAjustesApp,
  });

  final DocumentReference? refAjustesApp;

  @override
  State<WidgetBuilderWidget> createState() => _WidgetBuilderWidgetState();
}

class _WidgetBuilderWidgetState extends State<WidgetBuilderWidget> {
  late WidgetBuilderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WidgetBuilderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (_model.moduloAVer == 'home') {
          return wrapWithModel(
            model: _model.homeMenuModel,
            updateCallback: () => safeSetState(() {}),
            updateOnChange: true,
            child: HomeMenuWidget(
              docAjustesApp: widget.refAjustesApp!,
              moduloAVer: (moduloNombre) async {
                _model.moduloAVer = moduloNombre;
                safeSetState(() {});
              },
            ),
          );
        } else if (_model.moduloAVer == 'inventario') {
          return wrapWithModel(
            model: _model.inventarioMenuModel,
            updateCallback: () => safeSetState(() {}),
            updateOnChange: true,
            child: InventarioMenuWidget(
              regresar: (regresarAHome) async {
                _model.moduloAVer = regresarAHome;
                safeSetState(() {});
              },
            ),
          );
        } else if (_model.moduloAVer == 'ordenes') {
          return wrapWithModel(
            model: _model.ordenesMenuModel,
            updateCallback: () => safeSetState(() {}),
            child: OrdenesMenuWidget(
              regresar: (regresarAHome) async {
                _model.moduloAVer = regresarAHome;
                safeSetState(() {});
              },
            ),
          );
        } else {
          return wrapWithModel(
            model: _model.reporteriaMenuModel,
            updateCallback: () => safeSetState(() {}),
            child: ReporteriaMenuWidget(
              regresar: (regresarAHome) async {
                _model.moduloAVer = regresarAHome;
                safeSetState(() {});
              },
            ),
          );
        }
      },
    );
  }
}
