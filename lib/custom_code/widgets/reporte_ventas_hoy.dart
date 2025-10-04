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

class ReporteVentasHoy extends StatefulWidget {
  const ReporteVentasHoy({
    super.key,
    this.width,
    this.height,
    required this.listaCompras,
    required this.listaClientesFrecuentes,
    required this.fechaReporte, // Nuevo parámetro
  });

  final double? width;
  final double? height;
  final List<OdenCompraRecord> listaCompras;
  final List<ClientesFrecuentesRecord> listaClientesFrecuentes;
  final DateTime fechaReporte; // Fecha específica para el reporte

  @override
  State<ReporteVentasHoy> createState() => _ReporteVentasHoyState();
}

class _ReporteVentasHoyState extends State<ReporteVentasHoy> {
  List<OdenCompraRecord> _ordenesFiltradas = [];
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _aplicarFiltros();
  }

  // Función para verificar si una fecha coincide con la fecha del reporte
  bool _esFechaDelReporte(DateTime? fecha) {
    if (fecha == null) return false;

    return fecha.year == widget.fechaReporte.year &&
        fecha.month == widget.fechaReporte.month &&
        fecha.day == widget.fechaReporte.day;
  }

  // Formatear fecha para mostrar
  String _formatearFecha(DateTime fecha) {
    return '${fecha.day.toString().padLeft(2, '0')}/${fecha.month.toString().padLeft(2, '0')}/${fecha.year}';
  }

  void _aplicarFiltros() {
    setState(() {
      _ordenesFiltradas = widget.listaCompras.where((orden) {
        final cumpleEstado = orden.estado == 'Completado';
        final cumpleFecha = _esFechaDelReporte(orden.fechaEmision);

        return cumpleEstado && cumpleFecha;
      }).toList();
    });
  }

  String _obtenerNombreCliente(OdenCompraRecord orden) {
    if (orden.refClienteFrecuente != null) {
      try {
        final cliente = widget.listaClientesFrecuentes.firstWhere(
          (c) => c.reference.id == orden.refClienteFrecuente!.id,
        );

        if (cliente.nombreCompleto != null &&
            cliente.nombreCompleto!.isNotEmpty) {
          return cliente.nombreCompleto!;
        } else if (cliente.razonSocial != null &&
            cliente.razonSocial!.isNotEmpty) {
          return cliente.razonSocial!;
        } else {
          return 'Cliente no identificado';
        }
      } catch (e) {
        return 'Cliente no encontrado';
      }
    }
    return orden.nombre ?? 'Cliente no registrado';
  }

  double _calcularTotalVentas() {
    return _ordenesFiltradas.fold(
        0.0, (sum, orden) => sum + (orden.totalAPagar ?? 0.0));
  }

  int _calcularTotalProductos() {
    return _ordenesFiltradas.fold(0, (sum, orden) {
      if (orden.prodcutosComprados != null) {
        for (final producto in orden.prodcutosComprados!) {
          sum += producto.cantidad ?? 0;
        }
      }
      return sum;
    });
  }

  int _calcularCantidadProductosEnOrden(OdenCompraRecord orden) {
    if (orden.prodcutosComprados == null) return 0;
    return orden.prodcutosComprados!
        .fold(0, (sum, producto) => sum + (producto.cantidad ?? 0));
  }

  int _calcularCantidadItemsEnOrden(OdenCompraRecord orden) {
    return orden.prodcutosComprados?.length ?? 0;
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
                  'Reporte de Ventas',
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
                      'Fecha del reporte: ${_formatearFecha(widget.fechaReporte)}'),
                  pw.Text(
                      'Total de ventas: \¢${_calcularTotalVentas().toStringAsFixed(2)}'),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Text('Total de órdenes: ${_ordenesFiltradas.length}'),
              pw.Text(
                  'Total de productos vendidos: ${_calcularTotalProductos()}'),
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
                        child: pw.Text('Cliente',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Hora',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Items',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Total',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                    ],
                  ),
                  ..._ordenesFiltradas.map((orden) {
                    return pw.TableRow(
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text(orden.numeroOrden),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text(_obtenerNombreCliente(orden)),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text(orden.fechaEmision
                                  ?.toString()
                                  .split(' ')[1]
                                  ?.substring(0, 5) ??
                              ''),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text(
                              _calcularCantidadItemsEnOrden(orden).toString()),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text(
                              '\¢${orden.totalAPagar?.toStringAsFixed(2) ?? '0.00'}'),
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
      padding: const EdgeInsets.all(16),
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
                'Reporte de Ventas',
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
          const SizedBox(height: 8),
          Text(
            'Fecha: ${_formatearFecha(widget.fechaReporte)}',
            style: TextStyle(
              fontSize: 16,
              color: _isDarkMode ? Colors.grey[400] : Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 4,
            shadowColor: _isDarkMode ? Colors.black : Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatCard(
                        'Total Ventas',
                        '\¢${_calcularTotalVentas().toStringAsFixed(2)}',
                        Icons.payments,
                        Colors.green,
                      ),
                      _buildStatCard(
                        'Órdenes',
                        _ordenesFiltradas.length.toString(),
                        Icons.shopping_cart,
                        Colors.blue,
                      ),
                      _buildStatCard(
                        'Productos',
                        _calcularTotalProductos().toString(),
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
              child: _ordenesFiltradas.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.receipt_long,
                              size: 64, color: Colors.grey),
                          const SizedBox(height: 16),
                          Text(
                            'No hay ventas completadas para ${_formatearFecha(widget.fechaReporte)}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _ordenesFiltradas.length,
                      itemBuilder: (context, index) {
                        final orden = _ordenesFiltradas[index];
                        return _buildVentaItem(orden, index);
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
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVentaItem(OdenCompraRecord orden, int index) {
    final nombreCliente = _obtenerNombreCliente(orden);
    final cantidadProductos = _calcularCantidadProductosEnOrden(orden);
    final cantidadItems = _calcularCantidadItemsEnOrden(orden);
    final hora =
        orden.fechaEmision?.toString().split(' ')[1]?.substring(0, 5) ?? '';

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
          nombreCliente,
          style: TextStyle(
            color: _isDarkMode ? Colors.grey[400] : Colors.grey[600],
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\¢${orden.totalAPagar?.toStringAsFixed(2) ?? '0.00'}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.green,
              ),
            ),
            Text(
              hora,
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
                    Icon(Icons.person, size: 16, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(child: Text('Cliente: $nombreCliente')),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text('Hora: $hora'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.inventory_2, size: 16, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text(
                        'Artículos: $cantidadItems productos ($cantidadProductos unidades)'),
                  ],
                ),
                if (orden.metodoPago != null && orden.metodoPago!.isNotEmpty)
                  Row(
                    children: [
                      Icon(Icons.payment, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text('Método de pago: ${orden.metodoPago}'),
                    ],
                  ),
                const SizedBox(height: 12),
                if (orden.prodcutosComprados != null &&
                    orden.prodcutosComprados!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Productos comprados:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...orden.prodcutosComprados!.map((producto) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            child: Icon(Icons.shopping_bag, color: Colors.blue),
                          ),
                          title: Text(
                              producto.nombreProducto ?? 'Producto sin nombre'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Cantidad: ${producto.cantidad ?? 0}'),
                              if (producto.sKUProducto != null &&
                                  producto.sKUProducto!.isNotEmpty)
                                Text('SKU: ${producto.sKUProducto}'),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '\¢${producto.precio?.toStringAsFixed(2) ?? '0.00'} c/u',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                '\¢${producto.total?.toStringAsFixed(2) ?? '0.00'}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
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
