// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class Tienda extends StatefulWidget {
  const Tienda({
    super.key,
    this.width,
    this.height,
    required this.listaProductos,
    required this.regresaLista,
    required this.realizarPedido,
    this.listaExistente,
    required this.regresaTotal,
  });

  final double? width;
  final double? height;
  final List<ProductosRecord> listaProductos;
  final List<ProductosOrdenesClientesStruct>? listaExistente;
  final Future Function(List<ProductosOrdenesClientesStruct> productos)
      regresaLista;
  final Future Function() realizarPedido;
  final Future Function(int total) regresaTotal;

  @override
  State<Tienda> createState() => _TiendaState();
}

class _TiendaState extends State<Tienda> {
  List<ProductosOrdenesClientesStruct> productosSeleccionados = [];
  TextEditingController searchController = TextEditingController();
  TextEditingController caloriasController = TextEditingController();
  String? filtroCategoria;
  Map<String, int> cantidadesProductos = {};
  Set<String> productosExpandidos = {};

  List<String> get categoriasUnicas {
    final categorias =
        widget.listaProductos.map((p) => p.categoria).toSet().toList();
    categorias.sort();
    return ['Todas'] + categorias;
  }

  @override
  void initState() {
    super.initState();
    filtroCategoria = categoriasUnicas.first;

    if (widget.listaExistente != null && widget.listaExistente!.isNotEmpty) {
      _cargarListaExistente();
    }
  }

  void _cargarListaExistente() {
    setState(() {
      productosSeleccionados = List.from(widget.listaExistente!);

      for (var producto in productosSeleccionados) {
        cantidadesProductos[producto.sKUProducto] = producto.cantidad;
      }
    });

    widget.regresaLista(productosSeleccionados);
    widget.regresaTotal(totalGeneral);
  }

  List<ProductosRecord> get productosFiltrados {
    return widget.listaProductos.where((producto) {
      final matchesNombre = searchController.text.isEmpty ||
          producto.nombreProducto
              .toLowerCase()
              .contains(searchController.text.toLowerCase());

      final matchesCalorias = caloriasController.text.isEmpty ||
          (producto.calorias != null &&
              producto.calorias.toString().contains(caloriasController.text));

      final matchesCategoria =
          filtroCategoria == 'Todas' || producto.categoria == filtroCategoria;

      return matchesNombre && matchesCalorias && matchesCategoria;
    }).toList();
  }

  void actualizarCantidad(String sku, int cantidad) {
    setState(() {
      cantidadesProductos[sku] = cantidad;

      if (cantidad > 0) {
        final producto = widget.listaProductos.firstWhere((p) => p.sku == sku);
        final index =
            productosSeleccionados.indexWhere((p) => p.sKUProducto == sku);

        if (index >= 0) {
          productosSeleccionados[index] = ProductosOrdenesClientesStruct(
            nombreProducto: producto.nombreProducto,
            precio: producto.precio,
            refProducto: producto.reference,
            cantidad: cantidad,
            total: producto.precio * cantidad,
            fechaCompra: getCurrentTimestamp,
            fotoProducto: producto.imagen,
            sKUProducto: producto.sku,
          );
        } else {
          productosSeleccionados.add(ProductosOrdenesClientesStruct(
            nombreProducto: producto.nombreProducto,
            precio: producto.precio,
            refProducto: producto.reference,
            cantidad: cantidad,
            total: producto.precio * cantidad,
            fechaCompra: getCurrentTimestamp,
            fotoProducto: producto.imagen,
            sKUProducto: producto.sku,
          ));
        }
      } else {
        productosSeleccionados.removeWhere((p) => p.sKUProducto == sku);
      }

      widget.regresaLista(productosSeleccionados);
      widget.regresaTotal(totalGeneral);
    });
  }

  int get totalGeneral {
    return productosSeleccionados.fold(
        0, (sum, producto) => sum + producto.total);
  }

  int get cantidadTotalProductos {
    return productosSeleccionados.fold(
        0, (sum, producto) => sum + producto.cantidad);
  }

  void _toggleExpansion(String sku) {
    setState(() {
      if (productosExpandidos.contains(sku)) {
        productosExpandidos.remove(sku);
      } else {
        productosExpandidos.add(sku);
      }
    });
  }

  bool _estaExpandido(String sku) {
    return productosExpandidos.contains(sku);
  }

  Widget _buildCantidadSelector(ProductosRecord producto) {
    final cantidadActual = cantidadesProductos[producto.sku] ?? 0;

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primary,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x33000000),
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              color: cantidadActual > 0
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryText,
              size: 20,
            ),
            onPressed: () {
              if (cantidadActual > 0) {
                actualizarCantidad(producto.sku, cantidadActual - 1);
              }
            },
          ),
          Container(
            width: 40,
            child: Text(
              cantidadActual.toString(),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: producto.estado &&
                      (producto.cantidad == null ||
                          cantidadActual < producto.cantidad!)
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryText,
              size: 20,
            ),
            onPressed: producto.estado &&
                    (producto.cantidad == null ||
                        cantidadActual < producto.cantidad!)
                ? () {
                    actualizarCantidad(producto.sku, cantidadActual + 1);
                  }
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildProductoCard(ProductosRecord producto) {
    final diasParaCaducar = producto.caducidad != null
        ? producto.caducidad!.difference(DateTime.now()).inDays
        : 0;

    final cantidadSeleccionada = cantidadesProductos[producto.sku] ?? 0;
    final estaSeleccionado = cantidadSeleccionada > 0;
    final estaExpandido = _estaExpandido(producto.sku);

    return GestureDetector(
      onTap: () {
        _toggleExpansion(producto.sku);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.1),
              offset: Offset(0, 2),
            )
          ],
          border: Border.all(
            color: estaSeleccionado
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).alternate,
            width: estaSeleccionado ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: estaSeleccionado
                    ? FlutterFlowTheme.of(context).primary.withOpacity(0.1)
                    : FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '¢${producto.precio}',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Row(
                    children: [
                      if (estaSeleccionado)
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '$cantidadSeleccionada seleccionado(s)',
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                          ),
                        ),
                      SizedBox(width: 8),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: producto.estado
                              ? Color(0xFF4CAF50)
                              : Color(0xFFF44336),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          producto.estado ? 'Disponible' : 'No disponible',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          producto.categoria,
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 10,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    producto.nombreProducto,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 14,
                        color: diasParaCaducar <= 7
                            ? Color(0xFFF44336)
                            : diasParaCaducar <= 30
                                ? Color(0xFFFF9800)
                                : Color(0xFF4CAF50),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Caduca en $diasParaCaducar días',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Readex Pro',
                              color: diasParaCaducar <= 7
                                  ? Color(0xFFF44336)
                                  : FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.local_fire_department,
                        size: 14,
                        color: Color(0xFFFF9800),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '${producto.calorias} kcal',
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Unidades Disponibles: ${producto.cantidad}',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 10,
                        ),
                  ),
                  if (producto.descripcion != null &&
                      producto.descripcion!.isNotEmpty)
                    _buildDescripcionExpandible(producto, estaExpandido),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cantidad:',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      _buildCantidadSelector(producto),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescripcionExpandible(
      ProductosRecord producto, bool estaExpandido) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: estaExpandido ? null : 0,
          child: Visibility(
            visible: estaExpandido,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Descripción:',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 4),
                Text(
                  producto.descripcion!,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 12,
                      ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                estaExpandido ? Icons.expand_less : Icons.expand_more,
                size: 20,
                color: FlutterFlowTheme.of(context).primary,
              ),
              SizedBox(width: 4),
              Text(
                estaExpandido ? 'Ver menos' : 'Ver descripción',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 12,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.category,
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Categoría:',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: filtroCategoria,
                            isExpanded: true,
                            items: categoriasUnicas.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(value),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                filtroCategoria = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          labelText: 'Buscar por nombre',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      width: 120,
                      child: TextField(
                        controller: caloriasController,
                        decoration: InputDecoration(
                          labelText: 'Calorías',
                          prefixIcon: Icon(Icons.local_fire_department),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (productosSeleccionados.isNotEmpty)
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                border: Border(
                  bottom: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Productos seleccionados:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        '$cantidadTotalProductos productos',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        '¢$totalGeneral',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          Expanded(
            child: productosFiltrados.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inventory_2,
                          size: 64,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No se encontraron productos',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: productosFiltrados.length,
                    itemBuilder: (context, index) {
                      return _buildProductoCard(productosFiltrados[index]);
                    },
                  ),
          ),
          if (productosSeleccionados.isNotEmpty)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                border: Border(
                  top: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: FlutterFlowTheme.of(context)
                        .primaryText
                        .withOpacity(0.1),
                    offset: Offset(0, -2),
                  )
                ],
              ),
              child: ElevatedButton(
                onPressed: () async {
                  await widget.realizarPedido();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  foregroundColor: Colors.white,
                  elevation: 3,
                  minimumSize: Size(double.infinity, 50),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_checkout,
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Actualizar Pedido',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    caloriasController.dispose();
    super.dispose();
  }
}
