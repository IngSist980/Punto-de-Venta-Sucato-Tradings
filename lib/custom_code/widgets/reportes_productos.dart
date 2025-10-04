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

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class ReportesProductos extends StatefulWidget {
  const ReportesProductos({
    super.key,
    this.width,
    this.height,
    required this.listaProductos,
  });

  final double? width;
  final double? height;
  final List<ProductosRecord> listaProductos;

  @override
  State<ReportesProductos> createState() => _ReportesProductosState();
}

class _ReportesProductosState extends State<ReportesProductos> {
  String? _selectedCategory;
  List<ProductosRecord> _filteredProducts = [];
  final Map<String, int> _categoryCounts = {};

  @override
  void initState() {
    super.initState();
    _calculateCategoryCounts();
  }

  void _calculateCategoryCounts() {
    final categories = widget.listaProductos
        .map((product) => product.categoria ?? '')
        .toSet()
        .toList();

    for (var category in categories) {
      _categoryCounts[category] = widget.listaProductos
          .where((product) => product.categoria == category)
          .length;
    }

    if (categories.isNotEmpty) {
      _selectedCategory = categories.first;
      _filterProductsByCategory(_selectedCategory!);
    }
  }

  void _filterProductsByCategory(String category) {
    setState(() {
      _selectedCategory = category;
      _filteredProducts = widget.listaProductos
          .where((product) => product.categoria == category)
          .toList();
    });
  }

  int _calculateDaysDifference(DateTime date) {
    final now = DateTime.now();
    return now.difference(date).inDays;
  }

  int _calculateDaysToExpiry(DateTime? expiryDate) {
    if (expiryDate == null) return 999;
    final now = DateTime.now();
    return expiryDate.difference(now).inDays;
  }

  int _calculateSalesDifference(ProductosRecord product) {
    final cantidadVendida = product.cantidadVendidas ?? 0;
    final cantidadDisponible = product.cantidad ?? 0;

    return cantidadVendida;
  }

  double _calculateSalesPercentage(ProductosRecord product) {
    final cantidadVendida = product.cantidadVendidas ?? 0;
    final cantidadDisponible = product.cantidad ?? 0;
    final total = cantidadVendida + cantidadDisponible;

    if (total == 0) return 0.0;
    return (cantidadVendida / total) * 100;
  }

  Color _getBackgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.background;
  }

  Color _getSurfaceColor(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }

  Color _getOnSurfaceColor(BuildContext context) {
    return Theme.of(context).colorScheme.onSurface;
  }

  Color _getOnBackgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.onBackground;
  }

  Color _getPrimaryColor(BuildContext context) {
    return Theme.of(context).colorScheme.primary;
  }

  Color _getOutlineColor(BuildContext context) {
    return Theme.of(context).colorScheme.outline;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _getSurfaceColor(context),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.analytics, color: _getPrimaryColor(context)),
              const SizedBox(width: 8),
              Text(
                'Reporte de Productos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _getOnSurfaceColor(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: _getBackgroundColor(context),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: _getOutlineColor(context)),
            ),
            child: DropdownButton<String>(
              value: _selectedCategory,
              isExpanded: true,
              underline: const SizedBox(),
              icon:
                  Icon(Icons.arrow_drop_down, color: _getPrimaryColor(context)),
              items: _categoryCounts.keys.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Row(
                    children: [
                      Icon(Icons.category,
                          size: 18, color: _getOutlineColor(context)),
                      const SizedBox(width: 8),
                      Text(category,
                          style: TextStyle(
                            fontSize: 14,
                            color: _getOnBackgroundColor(context),
                          )),
                      const Spacer(),
                      Text(
                        '(${_categoryCounts[category]})',
                        style: TextStyle(
                          fontSize: 12,
                          color: _getOutlineColor(context),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                if (newValue != null) _filterProductsByCategory(newValue);
              },
            ),
          ),
          const SizedBox(height: 24),
          if (_filteredProducts.isNotEmpty)
            SizedBox(
              height: 200,
              child: SfCartesianChart(
                margin: EdgeInsets.zero,
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(
                  labelRotation: -45,
                  majorGridLines: const MajorGridLines(width: 0),
                  labelStyle: TextStyle(color: _getOnBackgroundColor(context)),
                ),
                primaryYAxis: NumericAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  majorTickLines: const MajorTickLines(size: 0),
                  labelStyle: TextStyle(color: _getOnBackgroundColor(context)),
                ),
                series: <CartesianSeries>[
                  ColumnSeries<SalesData, String>(
                    dataSource: _filteredProducts
                        .map((product) => SalesData(
                              product.nombreProducto ?? 'Sin nombre',
                              product.cantidadVendidas ?? 0,
                              product.cantidad ?? 0,
                            ))
                        .toList(),
                    xValueMapper: (data, _) => data.productName,
                    yValueMapper: (data, _) => data.sold,
                    name: 'Vendidas',
                    color: Colors.green[400],
                    width: 0.3,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  ColumnSeries<SalesData, String>(
                    dataSource: _filteredProducts
                        .map((product) => SalesData(
                              product.nombreProducto ?? 'Sin nombre',
                              product.cantidadVendidas ?? 0,
                              product.cantidad ?? 0,
                            ))
                        .toList(),
                    xValueMapper: (data, _) => data.productName,
                    yValueMapper: (data, _) => data.available,
                    name: 'Disponibles',
                    color: _getPrimaryColor(context),
                    width: 0.3,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  format: 'point.y unidades',
                ),
                legend: Legend(
                  isVisible: true,
                  position: LegendPosition.top,
                  textStyle: TextStyle(color: _getOnBackgroundColor(context)),
                ),
              ),
            ),
          const SizedBox(height: 24),
          Expanded(
            child: _filteredProducts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.inventory_2,
                            size: 48, color: _getOutlineColor(context)),
                        const SizedBox(height: 16),
                        Text(
                          'No hay productos en esta categoría',
                          style: TextStyle(color: _getOutlineColor(context)),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = _filteredProducts[index];
                      final daysDiff = _calculateDaysDifference(
                          product.createdTime ?? DateTime.now());
                      final daysToExpiry =
                          _calculateDaysToExpiry(product.caducidad);
                      final salesDifference =
                          _calculateSalesDifference(product);
                      final salesPercentage =
                          _calculateSalesPercentage(product);
                      final currentQuantity = product.cantidad ?? 0;
                      final soldQuantity = product.cantidadVendidas ?? 0;

                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: _getSurfaceColor(context),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color:
                                    _getSalesPerformanceColor(salesPercentage)
                                        .withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                _getSalesPerformanceIcon(salesPercentage),
                                color:
                                    _getSalesPerformanceColor(salesPercentage),
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.nombreProducto ?? 'Sin nombre',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: _getOnSurfaceColor(context),
                                      )),
                                  const SizedBox(height: 4),
                                  Text('Vendidas: $soldQuantity unidades',
                                      style: TextStyle(
                                        color: Colors.green[600],
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text('Disponibles: $currentQuantity unidades',
                                      style: TextStyle(
                                        color: _getOutlineColor(context),
                                        fontSize: 12,
                                      )),
                                  Text(
                                      'Porcentaje vendido: ${salesPercentage.toStringAsFixed(1)}%',
                                      style: TextStyle(
                                        color: _getSalesPerformanceColor(
                                            salesPercentage),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text('Precio: \$${product.precio ?? 0}',
                                      style: TextStyle(
                                        color: _getOutlineColor(context),
                                        fontSize: 12,
                                      )),
                                  if (product.caducidad != null)
                                    Text(
                                      daysToExpiry > 0
                                          ? 'Caduca en: $daysToExpiry días'
                                          : 'Caducado hace: ${daysToExpiry.abs()} días',
                                      style: TextStyle(
                                        color: daysToExpiry <= 7
                                            ? Colors.red
                                            : _getOutlineColor(context),
                                        fontSize: 11,
                                        fontWeight: daysToExpiry <= 7
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  Text('Creado hace: $daysDiff días',
                                      style: TextStyle(
                                        color: _getOutlineColor(context),
                                        fontSize: 10,
                                        fontStyle: FontStyle.italic,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    _getSalesPerformanceColor(salesPercentage)
                                        .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Text('$soldQuantity',
                                      style: TextStyle(
                                        color: _getSalesPerformanceColor(
                                            salesPercentage),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text('vendidas',
                                      style: TextStyle(
                                        color: _getSalesPerformanceColor(
                                            salesPercentage),
                                        fontSize: 10,
                                      )),
                                  Text('${salesPercentage.toStringAsFixed(0)}%',
                                      style: TextStyle(
                                        color: _getSalesPerformanceColor(
                                            salesPercentage),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Color _getSalesPerformanceColor(double percentage) {
    if (percentage == 0) return Colors.grey;
    if (percentage < 25) return Colors.blue;
    if (percentage < 50) return Colors.green;
    if (percentage < 75) return Colors.orange;
    return Colors.red;
  }

  IconData _getSalesPerformanceIcon(double percentage) {
    if (percentage == 0) return Icons.trending_flat;
    if (percentage < 25) return Icons.trending_up;
    if (percentage < 50) return Icons.arrow_upward;
    if (percentage < 75) return Icons.rocket_launch;
    return Icons.whatshot;
  }

  Color _getProductStatusColor(ProductosRecord product) {
    final quantity = product.cantidad ?? 0;
    final daysToExpiry = _calculateDaysToExpiry(product.caducidad);

    if (quantity == 0) return Colors.red;
    if (daysToExpiry <= 0) return Colors.red;
    if (daysToExpiry <= 7) return Colors.orange;
    if (quantity <= 5) return Colors.orange;
    return Colors.green;
  }

  IconData _getProductStatusIcon(ProductosRecord product) {
    final quantity = product.cantidad ?? 0;
    final daysToExpiry = _calculateDaysToExpiry(product.caducidad);

    if (quantity == 0) return Icons.error_outline;
    if (daysToExpiry <= 0) return Icons.warning;
    if (daysToExpiry <= 7) return Icons.warning_amber;
    if (quantity <= 5) return Icons.inventory_2;
    return Icons.check_circle;
  }
}

class SalesData {
  SalesData(this.productName, this.sold, this.available);
  final String productName;
  final int sold;
  final int available;
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
