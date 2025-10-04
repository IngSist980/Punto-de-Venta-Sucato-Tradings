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

class ReporteComprasProveedores extends StatefulWidget {
  const ReporteComprasProveedores({
    super.key,
    this.width,
    this.height,
    required this.listaOrdenesProveedor,
  });

  final double? width;
  final double? height;
  final List<OrdenesProveedorRecord> listaOrdenesProveedor;

  @override
  State<ReporteComprasProveedores> createState() =>
      _ReporteComprasProveedoresState();
}

class _ReporteComprasProveedoresState extends State<ReporteComprasProveedores> {
  List<OrdenesProveedorRecord> _ordenesFiltradas = [];
  String _proveedorSeleccionado = 'Todos';
  String _estadoSeleccionado = 'Todos';
  bool _isDarkMode = false;
  bool _mostrarFiltros = false;
  final TextEditingController _searchController = TextEditingController();
  String _ordenamiento = 'Fecha reciente';

  @override
  void initState() {
    super.initState();
    _aplicarFiltros();
  }

  void _aplicarFiltros() {
    setState(() {
      _ordenesFiltradas = widget.listaOrdenesProveedor.where((orden) {
        final cumpleProveedor = _proveedorSeleccionado == 'Todos' ||
            orden.proveedorNombre == _proveedorSeleccionado;
        final cumpleEstado = _estadoSeleccionado == 'Todos' ||
            (_estadoSeleccionado == 'Activo' && orden.estado == true) ||
            (_estadoSeleccionado == 'Inactivo' && orden.estado == false);
        final cumpleBusqueda = _searchController.text.isEmpty ||
            orden.proveedorNombre
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()) ||
            orden.numeroOrden
                .toLowerCase()
                .contains(_searchController.text.toLowerCase());

        return cumpleProveedor && cumpleEstado && cumpleBusqueda;
      }).toList();

      _ordenarOrdenes();
    });
  }

  void _ordenarOrdenes() {
    switch (_ordenamiento) {
      case 'Fecha reciente':
        _ordenesFiltradas.sort((a, b) => (b.fechaEmision ?? DateTime(2000))
            .compareTo(a.fechaEmision ?? DateTime(2000)));
        break;
      case 'Fecha antigua':
        _ordenesFiltradas.sort((a, b) => (a.fechaEmision ?? DateTime(2000))
            .compareTo(b.fechaEmision ?? DateTime(2000)));
        break;
      case 'Proveedor A-Z':
        _ordenesFiltradas
            .sort((a, b) => a.proveedorNombre.compareTo(b.proveedorNombre));
        break;
      case 'Proveedor Z-A':
        _ordenesFiltradas
            .sort((a, b) => b.proveedorNombre.compareTo(a.proveedorNombre));
        break;
      case 'Más productos':
        _ordenesFiltradas.sort((a, b) =>
            (b.productos?.length ?? 0).compareTo(a.productos?.length ?? 0));
        break;
      case 'Menos productos':
        _ordenesFiltradas.sort((a, b) =>
            (a.productos?.length ?? 0).compareTo(b.productos?.length ?? 0));
        break;
    }
  }

  List<String> _obtenerOpcionesProveedores() {
    final proveedores = <String>['Todos'];
    for (final orden in widget.listaOrdenesProveedor) {
      if (!proveedores.contains(orden.proveedorNombre)) {
        proveedores.add(orden.proveedorNombre);
      }
    }
    return proveedores;
  }

  int _calcularTotalOrdenes() {
    return _ordenesFiltradas.length;
  }

  int _calcularTotalProductos() {
    return _ordenesFiltradas.fold(0, (sum, orden) {
      if (orden.productos != null) {
        for (final producto in orden.productos!) {
          sum += producto.cantidad ?? 0;
        }
      }
      return sum;
    });
  }

  int _calcularTotalItems() {
    return _ordenesFiltradas.fold(
        0, (sum, orden) => sum + (orden.productos?.length ?? 0));
  }

  int _calcularOrdenesActivas() {
    return _ordenesFiltradas.where((orden) => orden.estado == true).length;
  }

  int _calcularOrdenesInactivas() {
    return _ordenesFiltradas.where((orden) => orden.estado == false).length;
  }

  String _obtenerProductosTexto(OrdenesProveedorRecord orden) {
    if (orden.productos == null || orden.productos!.isEmpty) {
      return 'Sin productos';
    }
    return '${orden.productos!.length} productos';
  }

  String _obtenerCantidadTotalTexto(OrdenesProveedorRecord orden) {
    if (orden.productos == null || orden.productos!.isEmpty) {
      return '0 unidades';
    }
    final total = orden.productos!
        .fold(0, (sum, producto) => sum + (producto.cantidad ?? 0));
    return '$total unidades';
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
                  'Reporte de Compras a Proveedores',
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
                  pw.Text('Total órdenes: ${_calcularTotalOrdenes()}'),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Text('Proveedor: $_proveedorSeleccionado'),
              pw.Text('Estado: $_estadoSeleccionado'),
              pw.Text('Ordenamiento: $_ordenamiento'),
              pw.SizedBox(height: 10),
              pw.Text('Total productos: ${_calcularTotalProductos()} unidades'),
              pw.Text(
                  'Total items: ${_calcularTotalItems()} productos diferentes'),
              pw.Text('Órdenes activas: ${_calcularOrdenesActivas()}'),
              pw.Text('Órdenes inactivas: ${_calcularOrdenesInactivas()}'),
              pw.SizedBox(height: 20),
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Orden',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Proveedor',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Fecha',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Estado',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Productos',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Cantidad Total',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                    ],
                  ),
                  ..._ordenesFiltradas.map((orden) {
                    final estado = orden.estado == true ? 'Activo' : 'Inactivo';
                    final fecha =
                        orden.fechaEmision?.toString().split(' ')[0] ?? 'N/A';

                    return pw.TableRow(
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text(orden.numeroOrden),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text(orden.proveedorNombre),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text(fecha),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text(estado),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text(_obtenerProductosTexto(orden)),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text(_obtenerCantidadTotalTexto(orden)),
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
                'Compras a Proveedores',
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
                            labelText: 'Buscar por proveedor u orden',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) => _aplicarFiltros(),
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: _proveedorSeleccionado,
                          items: _obtenerOpcionesProveedores().map((proveedor) {
                            return DropdownMenuItem(
                              value: proveedor,
                              child: Text(proveedor),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _proveedorSeleccionado = value!;
                              _aplicarFiltros();
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Filtrar por proveedor',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: _estadoSeleccionado,
                          items: [
                            'Todos',
                            'Activo',
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
                            'Fecha reciente',
                            'Fecha antigua',
                            'Proveedor A-Z',
                            'Proveedor Z-A',
                            'Más productos',
                            'Menos productos',
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
                    'Total Órdenes',
                    _calcularTotalOrdenes().toString(),
                    Icons.shopping_cart,
                    Colors.blue,
                  ),
                  _buildStatCard(
                    'Total Productos',
                    _calcularTotalProductos().toString(),
                    Icons.inventory_2,
                    Colors.green,
                  ),
                  _buildStatCard(
                    'Items',
                    _calcularTotalItems().toString(),
                    Icons.list,
                    Colors.orange,
                  ),
                  _buildStatCard(
                    'Activas',
                    _calcularOrdenesActivas().toString(),
                    Icons.check_circle,
                    Colors.green,
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
              child: _ordenesFiltradas.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart,
                              size: 64, color: Colors.grey),
                          const SizedBox(height: 16),
                          Text(
                            'No hay órdenes de compra',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _ordenesFiltradas.length,
                      itemBuilder: (context, index) {
                        final orden = _ordenesFiltradas[index];
                        return _buildOrdenItem(orden, index);
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

  Widget _buildOrdenItem(OrdenesProveedorRecord orden, int index) {
    final estadoColor = orden.estado == true ? Colors.green : Colors.red;
    final estadoTexto = orden.estado == true ? 'Activo' : 'Inactivo';
    final fecha = orden.fechaEmision?.toString().split(' ')[0] ?? 'N/A';

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
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Text(
            (index + 1).toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          'Orden #${orden.numeroOrden}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        subtitle: Text(
          orden.proveedorNombre,
          style: TextStyle(
            color: _isDarkMode ? Colors.grey[400] : Colors.grey[600],
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.circle, size: 12, color: estadoColor),
                const SizedBox(width: 4),
                Text(
                  estadoTexto,
                  style: TextStyle(
                    color: estadoColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              fecha,
              style: TextStyle(
                color: _isDarkMode ? Colors.grey[400] : Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detalles de la orden:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.business, size: 16, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(
                        child: Text('Proveedor: ${orden.proveedorNombre}')),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text('Fecha: $fecha'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.inventory_2, size: 16, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text(
                        'Productos: ${_obtenerProductosTexto(orden)} (${_obtenerCantidadTotalTexto(orden)})'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.circle, size: 16, color: estadoColor),
                    const SizedBox(width: 8),
                    Text('Estado: $estadoTexto'),
                  ],
                ),
                const SizedBox(height: 12),
                if (orden.productos != null && orden.productos!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Productos solicitados:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...orden.productos!.map((producto) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            child: Icon(Icons.shopping_bag, color: Colors.blue),
                          ),
                          title:
                              Text(producto.producto ?? 'Producto sin nombre'),
                          trailing: Text(
                            '${producto.cantidad ?? 0} unidades',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
