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

class ReporteProductosMasVendidos extends StatefulWidget {
  const ReporteProductosMasVendidos({
    super.key,
    this.width,
    this.height,
    required this.listaProductos,
  });

  final double? width;
  final double? height;
  final List<ProductosRecord> listaProductos;

  @override
  State<ReporteProductosMasVendidos> createState() =>
      _ReporteProductosMasVendidosState();
}

class _ReporteProductosMasVendidosState
    extends State<ReporteProductosMasVendidos> {
  List<ProductosRecord> _productosFiltrados = [];
  String _categoriaSeleccionada = 'Todas';
  bool _isDarkMode = false;
  final TextEditingController _searchController = TextEditingController();
  String _ordenamiento = 'Más vendidos';

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
        final cumpleBusqueda = _searchController.text.isEmpty ||
            producto.nombreProducto
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()) ||
            (producto.sku != null &&
                producto.sku!
                    .toLowerCase()
                    .contains(_searchController.text.toLowerCase()));

        return cumpleCategoria && cumpleBusqueda;
      }).toList();

      _ordenarProductos();
    });
  }

  void _ordenarProductos() {
    switch (_ordenamiento) {
      case 'Más vendidos':
        _productosFiltrados.sort((a, b) =>
            (b.cantidadVendidas ?? 0).compareTo(a.cantidadVendidas ?? 0));
        break;
      case 'Menos vendidos':
        _productosFiltrados.sort((a, b) =>
            (a.cantidadVendidas ?? 0).compareTo(b.cantidadVendidas ?? 0));
        break;
      case 'Precio mayor':
        _productosFiltrados
            .sort((a, b) => (b.precio ?? 0).compareTo(a.precio ?? 0));
        break;
      case 'Precio menor':
        _productosFiltrados
            .sort((a, b) => (a.precio ?? 0).compareTo(b.precio ?? 0));
        break;
      case 'Nombre A-Z':
        _productosFiltrados
            .sort((a, b) => a.nombreProducto.compareTo(b.nombreProducto));
        break;
      case 'Nombre Z-A':
        _productosFiltrados
            .sort((a, b) => b.nombreProducto.compareTo(a.nombreProducto));
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

  int _calcularTotalVentasProductos() {
    return _productosFiltrados.fold(
        0, (sum, producto) => sum + (producto.cantidadVendidas ?? 0));
  }

  double _calcularIngresosTotales() {
    return _productosFiltrados.fold(0.0, (sum, producto) {
      final ventas = producto.cantidadVendidas ?? 0;
      final precio = producto.precio ?? 0;
      return sum + (ventas * precio);
    });
  }

  int _calcularProductosDisponibles() {
    return _productosFiltrados
        .where((p) => p.estado == true && (p.cantidad ?? 0) > 0)
        .length;
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
                  'Reporte de Productos Más Vendidos',
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
                  pw.Text('Total productos: ${_productosFiltrados.length}'),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Text('Categoría: $_categoriaSeleccionada'),
              pw.SizedBox(height: 10),
              pw.Text('Ordenamiento: $_ordenamiento'),
              pw.SizedBox(height: 10),
              pw.Text(
                  'Total ventas: ${_calcularTotalVentasProductos()} unidades'),
              pw.Text(
                  'Ingresos totales: \¢${_calcularIngresosTotales().toStringAsFixed(2)}'),
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
                        child: pw.Text('Vendidos',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Disponible',
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
                        child: pw.Text('Ingresos',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                    ],
                  ),
                  ..._productosFiltrados.map((producto) {
                    final ingresos = (producto.cantidadVendidas ?? 0) *
                        (producto.precio ?? 0);
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
                          child: pw.Text('${producto.cantidadVendidas ?? 0}'),
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
                          child: pw.Text('\¢${ingresos.toStringAsFixed(2)}'),
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
                'Productos Más Vendidos',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              IconButton(
                onPressed: _generarPDF,
                icon: Icon(Icons.picture_as_pdf, color: Colors.red),
                tooltip: 'Exportar a PDF',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 4,
            shadowColor: _isDarkMode ? Colors.black : Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Column(
                    children: [
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
                        value: _ordenamiento,
                        items: [
                          'Más vendidos',
                          'Menos vendidos',
                          'Precio mayor',
                          'Precio menor',
                          'Nombre A-Z',
                          'Nombre Z-A',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatCard(
                        'Total Ventas',
                        _calcularTotalVentasProductos().toString(),
                        Icons.shopping_cart,
                        Colors.green,
                      ),
                      _buildStatCard(
                        'Ingresos',
                        '\¢${_calcularIngresosTotales().toStringAsFixed(2)}',
                        Icons.payments,
                        Colors.blue,
                      ),
                      _buildStatCard(
                        'Disponibles',
                        _calcularProductosDisponibles().toString(),
                        Icons.inventory_2,
                        Colors.orange,
                      ),
                    ],
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
                            'No hay productos',
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
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: _isDarkMode ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductoItem(ProductosRecord producto, int index) {
    final ingresos = (producto.cantidadVendidas ?? 0) * (producto.precio ?? 0);
    final estadoColor = producto.estado == true ? Colors.green : Colors.red;
    final estadoTexto =
        producto.estado == true ? 'Disponible' : 'No disponible';

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
          backgroundColor: Colors.blueAccent,
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
                Text(estadoTexto),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${producto.cantidadVendidas ?? 0} vendidos',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Text(
              '\¢${ingresos.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
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
    final ingresos = (producto.cantidadVendidas ?? 0) * (producto.precio ?? 0);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Detalles del Producto'),
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
              Text('Unidades vendidas: ${producto.cantidadVendidas ?? 0}'),
              Text('Ingresos generados: \$${ingresos.toStringAsFixed(2)}'),
              if (producto.descripcion != null &&
                  producto.descripcion!.isNotEmpty)
                Text('Descripción: ${producto.descripcion}'),
              if (producto.proveedorName != null &&
                  producto.proveedorName!.isNotEmpty)
                Text('Proveedor: ${producto.proveedorName}'),
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
