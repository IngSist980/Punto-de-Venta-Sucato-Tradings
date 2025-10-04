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

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ReporteInventario extends StatefulWidget {
  const ReporteInventario({
    super.key,
    this.width,
    this.height,
    required this.listaProductos,
  });

  final double? width;
  final double? height;
  final List<ProductosRecord> listaProductos;

  @override
  State<ReporteInventario> createState() => _ReporteInventarioState();
}

class _ReporteInventarioState extends State<ReporteInventario> {
  List<ProductosRecord> _productosFiltrados = [];
  String _categoriaSeleccionada = 'Todas';
  String _estadoSeleccionado = 'Todos';
  bool _isDarkMode = false;
  bool _mostrarFiltros = false;
  final TextEditingController _searchController = TextEditingController();
  String _ordenamiento = 'Stock bajo';

  @override
  void initState() {
    super.initState();
    _aplicarFiltros();
  }

  void _aplicarFiltros() {
    setState(() {
      _productosFiltrados = widget.listaProductos.where((producto) {
        final cumpleCategoria = _categoriaSeleccionada == 'Todas' ||
            producto.categoria == _categoriaSeleccionada;
        final cumpleEstado = _estadoSeleccionado == 'Todos' ||
            (_estadoSeleccionado == 'Disponible' &&
                producto.estado == true &&
                (producto.cantidad ?? 0) > 0) ||
            (_estadoSeleccionado == 'Agotado' &&
                (producto.cantidad ?? 0) == 0) ||
            (_estadoSeleccionado == 'Inactivo' && producto.estado == false);
        final cumpleBusqueda = _searchController.text.isEmpty ||
            producto.nombreProducto
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()) ||
            (producto.sku != null &&
                producto.sku!
                    .toLowerCase()
                    .contains(_searchController.text.toLowerCase()));

        return cumpleCategoria && cumpleEstado && cumpleBusqueda;
      }).toList();

      _ordenarProductos();
    });
  }

  void _ordenarProductos() {
    switch (_ordenamiento) {
      case 'Stock bajo':
        _productosFiltrados
            .sort((a, b) => (a.cantidad ?? 0).compareTo(b.cantidad ?? 0));
        break;
      case 'Stock alto':
        _productosFiltrados
            .sort((a, b) => (b.cantidad ?? 0).compareTo(a.cantidad ?? 0));
        break;
      case 'Nombre A-Z':
        _productosFiltrados
            .sort((a, b) => a.nombreProducto.compareTo(b.nombreProducto));
        break;
      case 'Nombre Z-A':
        _productosFiltrados
            .sort((a, b) => b.nombreProducto.compareTo(a.nombreProducto));
        break;
      case 'Precio mayor':
        _productosFiltrados
            .sort((a, b) => (b.precio ?? 0).compareTo(a.precio ?? 0));
        break;
      case 'Precio menor':
        _productosFiltrados
            .sort((a, b) => (a.precio ?? 0).compareTo(b.precio ?? 0));
        break;
      case 'Próximo a caducar':
        _productosFiltrados.sort((a, b) {
          final aCaducidad = a.caducidad ?? DateTime(2100);
          final bCaducidad = b.caducidad ?? DateTime(2100);
          return aCaducidad.compareTo(bCaducidad);
        });
        break;
    }
  }

  List<String> _obtenerOpcionesCategorias() {
    final categorias = <String>['Todas'];
    for (final producto in widget.listaProductos) {
      if (producto.categoria != null &&
          producto.categoria!.isNotEmpty &&
          !categorias.contains(producto.categoria)) {
        categorias.add(producto.categoria!);
      }
    }
    return categorias;
  }

  int _calcularTotalProductos() {
    return _productosFiltrados.length;
  }

  int _calcularStockTotal() {
    return _productosFiltrados.fold(
        0, (sum, producto) => sum + (producto.cantidad ?? 0));
  }

  int _calcularProductosAgotados() {
    return _productosFiltrados.where((p) => (p.cantidad ?? 0) == 0).length;
  }

  int _calcularProductosStockBajo() {
    return _productosFiltrados
        .where((p) => (p.cantidad ?? 0) > 0 && (p.cantidad ?? 0) <= 5)
        .length;
  }

  int _calcularProductosProximosCaducar() {
    final ahora = DateTime.now();
    final en30Dias = ahora.add(Duration(days: 30));
    return _productosFiltrados
        .where((p) =>
            p.caducidad != null &&
            p.caducidad!.isAfter(ahora) &&
            p.caducidad!.isBefore(en30Dias))
        .length;
  }

  double _calcularValorInventario() {
    return _productosFiltrados.fold(0.0, (sum, producto) {
      final cantidad = producto.cantidad ?? 0;
      final precio = producto.precio ?? 0;
      return sum + (cantidad * precio);
    });
  }

  Future<void> _generarPDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Header(
                level: 0,
                child: pw.Text(
                  'Reporte de Inventario',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                      'Fecha de generación: ${DateTime.now().toString().split(' ')[0]}'),
                  pw.Text('Total productos: ${_calcularTotalProductos()}'),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Text('Categoría: $_categoriaSeleccionada'),
              pw.Text('Estado: $_estadoSeleccionado'),
              pw.Text('Ordenamiento: $_ordenamiento'),
              pw.SizedBox(height: 10),
              pw.Text('Stock total: ${_calcularStockTotal()} unidades'),
              pw.Text(
                  'Valor del inventario: \¢${_calcularValorInventario().toStringAsFixed(2)}'),
              pw.Text('Productos agotados: ${_calcularProductosAgotados()}'),
              pw.Text(
                  'Productos con stock bajo: ${_calcularProductosStockBajo()}'),
              pw.SizedBox(height: 20),
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Producto',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Categoría',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Stock',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Precio',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Valor',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Caducidad',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Estado',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                    ],
                  ),
                  ..._productosFiltrados.map((producto) {
                    final valor =
                        (producto.cantidad ?? 0) * (producto.precio ?? 0);
                    final estado = producto.estado == false
                        ? 'Inactivo'
                        : (producto.cantidad ?? 0) == 0
                            ? 'Agotado'
                            : 'Disponible';
                    final caducidad = producto.caducidad != null
                        ? producto.caducidad!.toString().split(' ')[0]
                        : 'N/A';

                    return pw.TableRow(
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text(producto.nombreProducto),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text(producto.categoria ?? 'Sin categoría'),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text('${producto.cantidad ?? 0}'),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text(
                              '\¢${producto.precio?.toStringAsFixed(2) ?? '0.00'}'),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text('\¢${valor.toStringAsFixed(2)}'),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text(caducidad),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text(estado),
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  @override
  Widget build(BuildContext context) {
    _isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reporte de Inventario',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _mostrarFiltros = !_mostrarFiltros;
                      });
                    },
                    icon: Icon(
                      _mostrarFiltros ? Icons.filter_alt_off : Icons.filter_alt,
                      color: _isDarkMode ? Colors.white : Colors.black,
                    ),
                    tooltip:
                        _mostrarFiltros ? 'Ocultar filtros' : 'Mostrar filtros',
                  ),
                  IconButton(
                    onPressed: _generarPDF,
                    icon: Icon(Icons.picture_as_pdf, color: Colors.red),
                    tooltip: 'Exportar a PDF',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_mostrarFiltros) ...[
            Card(
              elevation: 4,
              shadowColor: _isDarkMode ? Colors.black : Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Column(
                      children: [
                        TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            labelText: 'Buscar por producto o SKU',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) => _aplicarFiltros(),
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: _categoriaSeleccionada,
                          items: _obtenerOpcionesCategorias().map((categoria) {
                            return DropdownMenuItem(
                              value: categoria,
                              child: Text(categoria),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _categoriaSeleccionada = value!;
                              _aplicarFiltros();
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Filtrar por categoría',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: _estadoSeleccionado,
                          items: [
                            'Todos',
                            'Disponible',
                            'Agotado',
                            'Inactivo',
                          ].map((estado) {
                            return DropdownMenuItem(
                              value: estado,
                              child: Text(estado),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _estadoSeleccionado = value!;
                              _aplicarFiltros();
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Filtrar por estado',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: _ordenamiento,
                          items: [
                            'Stock bajo',
                            'Stock alto',
                            'Nombre A-Z',
                            'Nombre Z-A',
                            'Precio mayor',
                            'Precio menor',
                            'Próximo a caducar',
                          ].map((orden) {
                            return DropdownMenuItem(
                              value: orden,
                              child: Text(orden),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _ordenamiento = value!;
                              _aplicarFiltros();
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Ordenar por',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
          Card(
            elevation: 4,
            shadowColor: _isDarkMode ? Colors.black : Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 1.5,
                children: [
                  _buildStatCard(
                    'Total',
                    _calcularTotalProductos().toString(),
                    Icons.inventory_2,
                    Colors.blue,
                  ),
                  _buildStatCard(
                    'Stock',
                    _calcularStockTotal().toString(),
                    Icons.warehouse,
                    Colors.green,
                  ),
                  _buildStatCard(
                    'Valor Inv.',
                    '\¢${_calcularValorInventario().toStringAsFixed(2)}',
                    Icons.payments,
                    Colors.orange,
                  ),
                  _buildStatCard(
                    'Agotados',
                    _calcularProductosAgotados().toString(),
                    Icons.warning,
                    Colors.red,
                  ),
                  if (_calcularProductosStockBajo() > 0)
                    _buildStatCard(
                      'Stock Bajo',
                      _calcularProductosStockBajo().toString(),
                      Icons.error_outline,
                      Colors.orange,
                    ),
                  if (_calcularProductosProximosCaducar() > 0)
                    _buildStatCard(
                      'Próx. Caducar',
                      _calcularProductosProximosCaducar().toString(),
                      Icons.calendar_today,
                      Colors.purple,
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Card(
              elevation: 4,
              shadowColor: _isDarkMode ? Colors.black : Colors.grey[300],
              child: _productosFiltrados.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.inventory_2, size: 64, color: Colors.grey),
                          const SizedBox(height: 16),
                          Text(
                            'No hay productos en el inventario',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _productosFiltrados.length,
                      itemBuilder: (context, index) {
                        final producto = _productosFiltrados[index];
                        return _buildProductoItem(producto, index);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      String title, String value, IconData icon, Color color) {
    return Card(
      color: _isDarkMode ? Colors.grey[800] : Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: _isDarkMode ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductoItem(ProductosRecord producto, int index) {
    final valor = (producto.cantidad ?? 0) * (producto.precio ?? 0);
    final estado = producto.estado == false
        ? 'Inactivo'
        : (producto.cantidad ?? 0) == 0
            ? 'Agotado'
            : 'Disponible';
    final estadoColor = producto.estado == false
        ? Colors.grey
        : (producto.cantidad ?? 0) == 0
            ? Colors.red
            : (producto.cantidad ?? 0) <= 5
                ? Colors.orange
                : Colors.green;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: _isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: _isDarkMode ? Colors.black : Colors.grey[200]!,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: estadoColor,
          child: Text(
            (index + 1).toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          producto.nombreProducto,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Categoría: ${producto.categoria ?? 'Sin categoría'}'),
            Text('SKU: ${producto.sku ?? 'N/A'}'),
            Row(
              children: [
                Icon(Icons.circle, size: 12, color: estadoColor),
                const SizedBox(width: 4),
                Text(estado),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${producto.cantidad ?? 0} unidades',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: estadoColor,
              ),
            ),
            Text(
              '\¢${valor.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
        onTap: () {
          _mostrarDetallesProducto(producto);
        },
      ),
    );
  }

  void _mostrarDetallesProducto(ProductosRecord producto) {
    final valor = (producto.cantidad ?? 0) * (producto.precio ?? 0);
    final estado = producto.estado == false
        ? 'Inactivo'
        : (producto.cantidad ?? 0) == 0
            ? 'Agotado'
            : 'Disponible';
    final caducidad = producto.caducidad != null
        ? producto.caducidad!.toString().split(' ')[0]
        : 'No especificada';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Detalles del Producto - Inventario'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nombre: ${producto.nombreProducto}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Categoría: ${producto.categoria ?? 'Sin categoría'}'),
              Text('SKU: ${producto.sku ?? 'N/A'}'),
              Text(
                  'Precio: \¢${producto.precio?.toStringAsFixed(2) ?? '0.00'}'),
              Text('Cantidad disponible: ${producto.cantidad ?? 0}'),
              Text('Estado: $estado'),
              Text('Valor en inventario: \$${valor.toStringAsFixed(2)}'),
              Text('Fecha de caducidad: $caducidad'),
              if (producto.lote != null && producto.lote!.isNotEmpty)
                Text('Lote: ${producto.lote}'),
              if (producto.proveedorName != null &&
                  producto.proveedorName!.isNotEmpty)
                Text('Proveedor: ${producto.proveedorName}'),
              if (producto.descripcion != null &&
                  producto.descripcion!.isNotEmpty)
                Text('Descripción: ${producto.descripcion}'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
