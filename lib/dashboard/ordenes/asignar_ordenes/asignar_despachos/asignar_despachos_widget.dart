import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'asignar_despachos_model.dart';
export 'asignar_despachos_model.dart';

class AsignarDespachosWidget extends StatefulWidget {
  const AsignarDespachosWidget({
    super.key,
    required this.refOrden,
  });

  final DocumentReference? refOrden;

  @override
  State<AsignarDespachosWidget> createState() => _AsignarDespachosWidgetState();
}

class _AsignarDespachosWidgetState extends State<AsignarDespachosWidget> {
  late AsignarDespachosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AsignarDespachosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: StreamBuilder<List<RepartidorRecord>>(
          stream: queryRepartidorRecord(
            queryBuilder: (repartidorRecord) => repartidorRecord.where(
              'Estado',
              isEqualTo: true,
            ),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            List<RepartidorRecord> containerRepartidorRecordList =
                snapshot.data!;

            return Container(
              width: 600.0,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.8,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Asignar repartidor a la orden',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Comentario',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          FlutterFlowDropDown<String>(
                            controller: _model.repartidorValueController ??=
                                FormFieldController<String>(null),
                            options: containerRepartidorRecordList
                                .map((e) => e.nombreRepartidor)
                                .toList(),
                            onChanged: (val) async {
                              safeSetState(() => _model.repartidorValue = val);
                              _model.refRepartidor =
                                  containerRepartidorRecordList
                                      .where((e) =>
                                          e.nombreRepartidor ==
                                          _model.repartidorValue)
                                      .toList()
                                      .firstOrNull
                                      ?.reference;
                              _model.docRepartidor =
                                  containerRepartidorRecordList
                                      .where((e) =>
                                          e.nombreRepartidor ==
                                          _model.repartidorValue)
                                      .toList()
                                      .firstOrNull;
                              safeSetState(() {});
                            },
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            hintText: 'Seleccione repartidor...',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: Colors.transparent,
                            borderWidth: 0.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: false,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                          if (_model.refRepartidor != null)
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 500.0,
                              child: custom_widgets.HorarioRepartidor(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 500.0,
                                horario: containerRepartidorRecordList
                                    .where((e) =>
                                        e.nombreRepartidor ==
                                        _model.repartidorValue)
                                    .toList()
                                    .firstOrNull!
                                    .horario,
                                regresaLista: (listaActualizada) async {
                                  _model.horarioRepartidor = listaActualizada
                                      .toList()
                                      .cast<RepartidorRutaStruct>();
                                  safeSetState(() {});
                                },
                                regresaDia: (diaSeleccionado) async {
                                  _model.diaSeleccionado = diaSeleccionado;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            text: 'Cancelar',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).error,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              if (_model.diaSeleccionado != null &&
                                  _model.diaSeleccionado != '') {
                                await Future.wait([
                                  Future(() async {
                                    await widget.refOrden!
                                        .update(createOdenCompraRecordData(
                                      estado: 'Completado',
                                      repartidorNombre: _model.repartidorValue,
                                      refRepartidor: _model.refRepartidor,
                                      diaReparto: _model.diaSeleccionado,
                                      despachado: true,
                                    ));
                                  }),
                                  Future(() async {
                                    await _model.refRepartidor!.update({
                                      ...createRepartidorRecordData(
                                        ordenCompra: widget.refOrden,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'Horario':
                                              getRepartidorRutaListFirestoreData(
                                            _model.horarioRepartidor,
                                          ),
                                        },
                                      ),
                                    });
                                  }),
                                ]);
                                await actions.customToastification(
                                  context,
                                  'Éxito',
                                  'Se ha completado la orden correctamente',
                                  'success',
                                );
                                Navigator.pop(context);
                                return;
                              } else {
                                await actions.customToastification(
                                  context,
                                  'Error',
                                  'Debe seleccionar un dia de reparto',
                                  'error',
                                );
                                return;
                              }
                            },
                            text: 'Despachar',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
