import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ord002_model.dart';
export 'ord002_model.dart';

class Ord002Widget extends StatefulWidget {
  const Ord002Widget({super.key});

  static String routeName = 'ORD002';
  static String routePath = '/ord002';

  @override
  State<Ord002Widget> createState() => _Ord002WidgetState();
}

class _Ord002WidgetState extends State<Ord002Widget> {
  late Ord002Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Ord002Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('FloatingActionButton pressed ...');
          },
          backgroundColor: Colors.green,
          elevation: 3.0,
          child: Icon(
            Icons.refresh,
            color: Colors.white,
            size: 24.0,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          title: Text(
            'Estados de Órdenes',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  color: Colors.white,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: ListTile(
                      dense: false,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                    ),
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: ListTile(
                      dense: false,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                    ),
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: ListTile(
                      dense: false,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
