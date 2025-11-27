import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'editor_productos_model.dart';
export 'editor_productos_model.dart';

///
///
class EditorProductosWidget extends StatefulWidget {
  const EditorProductosWidget({
    super.key,
    required this.produtosEnLaOrden,
    required this.refOrden,
  });

  final List<ProductosOrdenesClientesStruct>? produtosEnLaOrden;
  final DocumentReference? refOrden;

  static String routeName = 'EditorProductos';
  static String routePath = '/editorProductos';

  @override
  State<EditorProductosWidget> createState() => _EditorProductosWidgetState();
}

class _EditorProductosWidgetState extends State<EditorProductosWidget> {
  late EditorProductosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditorProductosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.localProductosEnOrden = widget.produtosEnLaOrden!
          .toList()
          .cast<ProductosOrdenesClientesStruct>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Editar orden',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: StreamBuilder<List<ProductosRecord>>(
            stream: queryProductosRecord(),
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
              List<ProductosRecord> containerProductosRecordList =
                  snapshot.data!;

              return Container(
                constraints: BoxConstraints(
                  maxWidth: 900.0,
                ),
                decoration: BoxDecoration(),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: custom_widgets.Tienda(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    listaProductos: containerProductosRecordList,
                    listaExistente: _model.localProductosEnOrden,
                    regresaLista: (productos) async {
                      _model.localProductosEnOrden = productos
                          .toList()
                          .cast<ProductosOrdenesClientesStruct>();
                      safeSetState(() {});
                    },
                    realizarPedido: () async {
                      await widget.refOrden!.update({
                        ...createOdenCompraRecordData(
                          total: _model.total,
                        ),
                        ...mapToFirestore(
                          {
                            'ProdcutosComprados':
                                getProductosOrdenesClientesListFirestoreData(
                              _model.localProductosEnOrden,
                            ),
                          },
                        ),
                      });
                      await actions.customToastification(
                        context,
                        'Éxito',
                        'Se ha actualizado los productos de la orden',
                        'success',
                      );
                      context.safePop();
                    },
                    regresaTotal: (total) async {
                      _model.total = total;
                      safeSetState(() {});
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
