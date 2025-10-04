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

import 'package:intl/intl.dart';

class OrdenVistaProductos extends StatefulWidget {
  const OrdenVistaProductos({
    super.key,
    this.width,
    this.height,
    required this.listaExistente,
  });

  final double? width;
  final double? height;
  final List<ProductosOrdenesClientesStruct>? listaExistente;

  @override
  State<OrdenVistaProductos> createState() => _OrdenVistaProductosState();
}

class _OrdenVistaProductosState extends State<OrdenVistaProductos> {
  TextEditingController searchController = TextEditingController();
  String? filtroCategoria;

  List<String> get categoriasUnicas {
    return ['Todos los productos'];
  }

  @override
  void initState() {
    super.initState();
    filtroCategoria = categoriasUnicas.first;
  }

  List<ProductosOrdenesClientesStruct> get productosFiltrados {
    final productos = widget.listaExistente ?? [];

    return productos.where((producto) {
      final matchesNombre = searchController.text.isEmpty ||
          producto.nombreProducto
              .toLowerCase()
              .contains(searchController.text.toLowerCase());

      final matchesCategoria = filtroCategoria == 'Todos los productos';

      return matchesNombre && matchesCategoria;
    }).toList();
  }

  int get totalGeneral {
    final productos = widget.listaExistente ?? [];
    return productos.fold(0, (sum, producto) => sum + (producto.total ?? 0));
  }

  int get cantidadTotalProductos {
    final productos = widget.listaExistente ?? [];
    return productos.fold(0, (sum, producto) => sum + (producto.cantidad ?? 0));
  }

  Widget _buildProductoCard(ProductosOrdenesClientesStruct producto) {
    return Container(
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
          color: FlutterFlowTheme.of(context).primary,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '¢${producto.precio ?? 0}',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${producto.cantidad ?? 0} unidad(es)',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 10,
                        ),
                  ),
                ),
              ],
            ),
          ),
          if (producto.fotoProducto != null &&
              producto.fotoProducto!.isNotEmpty)
            Container(
              height: 120,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.zero,
                child: Image.network(
                  producto.fotoProducto!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 120,
                    color: FlutterFlowTheme.of(context).alternate,
                    child: Icon(
                      Icons.image_not_supported,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 40,
                    ),
                  ),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 120,
                      color: FlutterFlowTheme.of(context).alternate,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      producto.sKUProducto ?? 'Sin SKU',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent1,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Producto',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
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
                  producto.nombreProducto ?? 'Sin nombre',
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
                      Icons.attach_money,
                      size: 14,
                      color: FlutterFlowTheme.of(context).success,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Precio unitario: ¢${producto.precio ?? 0}',
                      style: FlutterFlowTheme.of(context).bodySmall,
                    ),
                    Spacer(),
                    Text(
                      'Subtotal: ¢${producto.total ?? 0}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontWeight: FontWeight.bold,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                if (producto.fechaCompra != null)
                  Text(
                    'Fecha: ${DateFormat('dd/MM/yyyy HH:mm').format(producto.fechaCompra!)}',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 10,
                        ),
                  ),
                SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Cantidad: ${producto.cantidad ?? 0}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        'Precio unitario: ¢${producto.precio ?? 0}',
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                      Text(
                        'Total: ¢${producto.total ?? 0}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontWeight: FontWeight.bold,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productos = widget.listaExistente ?? [];

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
                      Icons.filter_list,
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Filtro:',
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
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: 'Buscar por nombre de producto',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          if (productos.isNotEmpty)
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
                        'Productos en la orden:',
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
                        'Total general:',
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
            child: productos.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: 64,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No hay productos en esta orden',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                      ],
                    ),
                  )
                : productosFiltrados.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 64,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'No se encontraron productos con los filtros aplicados',
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
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
