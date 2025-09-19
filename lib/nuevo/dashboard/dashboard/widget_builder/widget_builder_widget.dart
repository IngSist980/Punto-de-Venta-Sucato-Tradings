import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'widget_builder_model.dart';
export 'widget_builder_model.dart';

class WidgetBuilderWidget extends StatefulWidget {
  const WidgetBuilderWidget({
    super.key,
    required this.widgetAMostrar,
  });

  final Widget Function()? widgetAMostrar;

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
    return Builder(builder: (_) {
      return widget.widgetAMostrar != null
          ? widget.widgetAMostrar!()
          : SizedBox.shrink();
    });
  }
}
