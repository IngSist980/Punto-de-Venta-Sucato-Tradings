// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';

Future crearFactura(OdenCompraRecord ordenCompra) async {
  try {
    final pdf = pw.Document();

    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
    final currencyFormat = NumberFormat.currency(
      symbol: '\¢',
      decimalDigits: 0,
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _buildHeader(ordenCompra, dateFormat),
              pw.SizedBox(height: 20),
              _buildCompanyInfo(),
              pw.SizedBox(height: 20),
              _buildClientInfo(ordenCompra),
              pw.SizedBox(height: 20),
              _buildProductsTable(ordenCompra, currencyFormat),
              pw.SizedBox(height: 20),
              _buildTotals(ordenCompra, currencyFormat),
              pw.SizedBox(height: 30),
              _buildFooter(),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  } catch (e) {
    print('Error al generar la factura: $e');
    throw Exception('Error al generar la factura: $e');
  }
}

pw.Widget _buildHeader(OdenCompraRecord ordenCompra, DateFormat dateFormat) {
  return pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: [
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'SUCATO TRADING',
            style: pw.TextStyle(
              fontSize: 24,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.blue800,
            ),
          ),
          pw.Text(
            'Sistema de Gestión Comercial',
            style: pw.TextStyle(
              fontSize: 12,
              color: PdfColors.grey600,
            ),
          ),
        ],
      ),
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [
          pw.Text(
            'FACTURA',
            style: pw.TextStyle(
              fontSize: 20,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.red800,
            ),
          ),
          pw.Text(
            'Nº: ${ordenCompra.numeroOrden}',
            style: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Text(
            'Fecha: ${dateFormat.format(ordenCompra.fechaEmision!)}',
            style: pw.TextStyle(fontSize: 12),
          ),
        ],
      ),
    ],
  );
}

pw.Widget _buildCompanyInfo() {
  return pw.Container(
    padding: pw.EdgeInsets.all(10),
    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: PdfColors.grey300),
      borderRadius: pw.BorderRadius.circular(5),
    ),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'SUCATO TRADING S.A.',
          style: pw.TextStyle(
            fontSize: 16,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.Text('RUC: 12345678901'),
        pw.Text('Av. Principal 123, Heredia, Costa Rica'),
        pw.Text('Teléfono: +506 74256325'),
        pw.Text('Email: info@sucatotrading.com'),
      ],
    ),
  );
}

pw.Widget _buildClientInfo(OdenCompraRecord ordenCompra) {
  return pw.Container(
    padding: pw.EdgeInsets.all(10),
    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: PdfColors.grey300),
      borderRadius: pw.BorderRadius.circular(5),
    ),
    child: pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'DATOS DEL CLIENTE',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 5),
              pw.Text('Nombre: ${ordenCompra.nombre}'),
              pw.Text('Vendedor: ${ordenCompra.empleadoNombre}'),
              pw.Text('Estado: ${ordenCompra.estado}'),
              if (ordenCompra.motivoEstado.isNotEmpty)
                pw.Text('Motivo: ${ordenCompra.motivoEstado}'),
            ],
          ),
        ),
        pw.Container(
          width: 1,
          margin: pw.EdgeInsets.symmetric(horizontal: 10),
          color: PdfColors.grey300,
        ),
        pw.Expanded(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'DATOS DEL REPARTIDOR',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 5),
              if (ordenCompra.repartidorNombre.isNotEmpty)
                pw.Text('Repartidor: ${ordenCompra.repartidorNombre}'),
              if (ordenCompra.diaReparto != null &&
                  ordenCompra.diaReparto!.isNotEmpty)
                pw.Text('Día de entrega: ${ordenCompra.diaReparto}'),
              if (ordenCompra.repartidorNombre.isEmpty &&
                  (ordenCompra.diaReparto == null ||
                      ordenCompra.diaReparto!.isEmpty))
                pw.Text(
                  'Sin datos de repartidor',
                  style: pw.TextStyle(
                    fontStyle: pw.FontStyle.italic,
                    color: PdfColors.grey600,
                  ),
                ),
            ],
          ),
        ),
      ],
    ),
  );
}

pw.Widget _buildProductsTable(
    OdenCompraRecord ordenCompra, NumberFormat currencyFormat) {
  final productos = ordenCompra.prodcutosComprados;

  return pw.Table(
    border: pw.TableBorder.all(color: PdfColors.grey300),
    columnWidths: {
      0: pw.FlexColumnWidth(3),
      1: pw.FlexColumnWidth(1),
      2: pw.FlexColumnWidth(1),
      3: pw.FlexColumnWidth(1),
    },
    children: [
      pw.TableRow(
        decoration: pw.BoxDecoration(color: PdfColors.grey200),
        children: [
          pw.Padding(
            padding: pw.EdgeInsets.all(8),
            child: pw.Text(
              'Producto',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.all(8),
            child: pw.Text(
              'Cantidad',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              textAlign: pw.TextAlign.center,
            ),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.all(8),
            child: pw.Text(
              'Precio',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              textAlign: pw.TextAlign.right,
            ),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.all(8),
            child: pw.Text(
              'Total',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              textAlign: pw.TextAlign.right,
            ),
          ),
        ],
      ),
      for (var producto in productos)
        pw.TableRow(
          children: [
            pw.Padding(
              padding: pw.EdgeInsets.all(8),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(producto.nombreProducto),
                  pw.Text(
                    'SKU: ${producto.sKUProducto}',
                    style: pw.TextStyle(fontSize: 10, color: PdfColors.grey600),
                  ),
                ],
              ),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(8),
              child: pw.Text(
                producto.cantidad.toString(),
                textAlign: pw.TextAlign.center,
              ),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(8),
              child: pw.Text(
                currencyFormat.format(producto.precio),
                textAlign: pw.TextAlign.right,
              ),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(8),
              child: pw.Text(
                currencyFormat.format(producto.total),
                textAlign: pw.TextAlign.right,
              ),
            ),
          ],
        ),
    ],
  );
}

pw.Widget _buildTotals(
    OdenCompraRecord ordenCompra, NumberFormat currencyFormat) {
  return pw.Container(
    width: double.infinity,
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [
            pw.SizedBox(width: 100),
            pw.Text('Subtotal:'),
            pw.SizedBox(width: 10),
            pw.Text(
              currencyFormat.format(ordenCompra.total),
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
          ],
        ),
        pw.SizedBox(height: 5),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [
            pw.SizedBox(width: 100),
            pw.Text('Impuesto:'),
            pw.SizedBox(width: 10),
            pw.Text(
              currencyFormat.format(ordenCompra.impuesto),
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
          ],
        ),
        pw.SizedBox(height: 5),
        if (ordenCompra.descuento > 0)
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.SizedBox(width: 100),
              pw.Text('Credito:'),
              pw.SizedBox(width: 10),
              pw.Text(
                '-${currencyFormat.format(ordenCompra.credito)}',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.red,
                ),
              ),
            ],
          ),
        pw.SizedBox(height: 5),
        if (ordenCompra.descuento > 0)
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.SizedBox(width: 100),
              pw.Text('Descuento:'),
              pw.SizedBox(width: 10),
              pw.Text(
                '-${currencyFormat.format(ordenCompra.descuento)}',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.red,
                ),
              ),
            ],
          ),
        if (ordenCompra.descuento > 0) pw.SizedBox(height: 5),
        pw.Divider(color: PdfColors.grey400),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [
            pw.SizedBox(width: 100),
            pw.Text(
              'TOTAL A PAGAR:',
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(width: 10),
            pw.Text(
              currencyFormat.format(ordenCompra.totalAPagar),
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.blue800,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

pw.Widget _buildFooter() {
  return pw.Container(
    width: double.infinity,
    child: pw.Column(
      children: [
        pw.Divider(color: PdfColors.grey400),
        pw.SizedBox(height: 10),
        pw.Text(
          '¡Gracias por su compra!',
          style: pw.TextStyle(
            fontSize: 14,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue800,
          ),
        ),
        pw.SizedBox(height: 5),
        pw.Text(
          'Para consultas o soporte, contacte a: soporte@sucatotrading.com',
          style: pw.TextStyle(fontSize: 10, color: PdfColors.grey600),
        ),
        pw.SizedBox(height: 5),
        pw.Text(
          'Factura generada electrónicamente - ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}',
          style: pw.TextStyle(fontSize: 8, color: PdfColors.grey500),
        ),
      ],
    ),
  );
}
