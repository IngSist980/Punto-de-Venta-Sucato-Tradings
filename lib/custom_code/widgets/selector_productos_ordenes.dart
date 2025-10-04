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

class SelectorProductosOrdenes extends StatefulWidget {
  const SelectorProductosOrdenes({
    super.key,
    this.width,
    this.height,
    required this.productosProveedor,
    required this.regeresaPedidos,
  });

  final double? width;
  final double? height;
  final List<ProductosProveedoresStruct> productosProveedor;
  final Future Function(List<PedidosProveedorStruct> listaProductos)
      regeresaPedidos;

  @override
  State<SelectorProductosOrdenes> createState() =>
      _SelectorProductosOrdenesState();
}

class _SelectorProductosOrdenesState extends State<SelectorProductosOrdenes> {
  final Map<String, int> _productosSeleccionados = {};

  Color _getBackgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.background;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: _buildListaProductos(),
          ),
          _buildBotonConfirmar(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.inventory_2,
            color: Colors.blue.shade700,
            size: 24,
          ),
          const SizedBox(width: 12),
          Text(
            'Productos del Proveedor',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
          ),
          const Spacer(),
          Badge(
            backgroundColor: Colors.blue.shade600,
            label: Text(
              _productosSeleccionados.length.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            child: Icon(
              Icons.shopping_cart_checkout,
              color: Colors.blue.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListaProductos() {
    if (widget.productosProveedor.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'No hay productos disponibles',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.productosProveedor.length,
      itemBuilder: (context, index) {
        final producto = widget.productosProveedor[index];
        final cantidad = _productosSeleccionados[producto.nombreProducto] ?? 0;
        final estaSeleccionado = cantidad > 0;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: estaSeleccionado ? Colors.green.shade50 : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: estaSeleccionado
                  ? Colors.green.shade200
                  : Colors.grey.shade200,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                setState(() {
                  if (estaSeleccionado) {
                    _productosSeleccionados.remove(producto.nombreProducto);
                  } else {
                    _productosSeleccionados[producto.nombreProducto] = 1;
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: estaSeleccionado ? Colors.green : Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: estaSeleccionado
                              ? Colors.green
                              : Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                      child: estaSeleccionado
                          ? const Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            producto.nombreProducto,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${producto.precioProveedor}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (estaSeleccionado) _buildContador(producto),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContador(ProductosProveedoresStruct producto) {
    final cantidad = _productosSeleccionados[producto.nombreProducto] ?? 0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              size: 18,
              color: cantidad > 1 ? Colors.red.shade600 : Colors.grey.shade400,
            ),
            onPressed: cantidad > 1
                ? () {
                    setState(() {
                      _productosSeleccionados[producto.nombreProducto] =
                          cantidad - 1;
                    });
                  }
                : null,
            padding: const EdgeInsets.all(4),
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              cantidad.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              size: 18,
              color: Colors.green.shade600,
            ),
            onPressed: () {
              setState(() {
                _productosSeleccionados[producto.nombreProducto] = cantidad + 1;
              });
            },
            padding: const EdgeInsets.all(4),
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
        ],
      ),
    );
  }

  Widget _buildBotonConfirmar() {
    final tieneSelecciones = _productosSeleccionados.isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        border: Border(
          top: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: tieneSelecciones ? _confirmarSeleccion : null,
          icon: const Icon(Icons.check_circle_outline, size: 20),
          label: const Text(
            'Confirmar Pedido',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade600,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            shadowColor: Colors.green.shade200,
          ),
        ),
      ),
    );
  }

  void _confirmarSeleccion() {
    final listaPedidos = _productosSeleccionados.entries
        .map((entry) => PedidosProveedorStruct(
              producto: entry.key,
              cantidad: entry.value,
            ))
        .toList();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text('Confirmar Pedido'),
          ],
        ),
        content: Text(
          '¿Estás seguro de confirmar ${listaPedidos.length} producto(s) seleccionado(s)?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);

              try {
                await widget.regeresaPedidos(listaPedidos);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        '${listaPedidos.length} producto(s) confirmado(s)'),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error al confirmar pedido: $e'),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade600,
            ),
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _productosSeleccionados.clear();
    super.dispose();
  }
}
