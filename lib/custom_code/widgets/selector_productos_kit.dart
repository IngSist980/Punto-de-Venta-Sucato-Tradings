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

class SelectorProductosKit extends StatefulWidget {
  const SelectorProductosKit({
    super.key,
    this.width,
    this.height,
    required this.listProductos,
    this.regresaLista,
  });

  final double? width;
  final double? height;
  final List<ProductosRecord> listProductos;
  final Future Function(List<PaqueteStruct> listaDataType)? regresaLista;

  @override
  State<SelectorProductosKit> createState() => _SelectorProductosKitState();
}

class _SelectorProductosKitState extends State<SelectorProductosKit> {
  final Map<String, int> _selectedQuantities = {};
  final List<PaqueteStruct> _selectedProducts = [];
  final ThemeMode _themeMode = ThemeMode.system;
  bool _isSubmitting = false;

  final _lightColors = {
    'primary': const Color(0xFF6A5AE0),
    'secondary': const Color(0xFF9D8DFF),
    'accent': const Color(0xFF4CD964),
    'background': const Color(0xFFF8F9FA),
    'card': Colors.white,
    'text': const Color(0xFF212121),
    'textSecondary': const Color(0xFF757575),
  };

  final _darkColors = {
    'primary': const Color(0xFF7C70FF),
    'secondary': const Color(0xFF5E4AE3),
    'accent': const Color(0xFF4CD964),
    'background': const Color(0xFF121212),
    'card': const Color(0xFF1E1E1E),
    'text': Colors.white,
    'textSecondary': const Color(0xFFB0B0B0),
  };

  @override
  void initState() {
    super.initState();
    for (var producto in widget.listProductos) {
      _selectedQuantities[producto.reference.id] = 0;
    }
  }

  Map<String, Color> get _colors {
    final brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark ? _darkColors : _lightColors;
  }

  void _incrementQuantity(String productId, int availableQuantity) {
    setState(() {
      final current = _selectedQuantities[productId] ?? 0;
      if (current < availableQuantity) {
        _selectedQuantities[productId] = current + 1;
      }
    });
  }

  int _calcularTotal() {
    int total = 0;
    for (var producto in widget.listProductos) {
      final selectedQty = _selectedQuantities[producto.reference.id] ?? 0;
      total += producto.precio * selectedQty;
    }
    return total;
  }

  String _formatoPrecio(int precio) {
    return '₡${precio.toStringAsFixed(2).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        )}';
  }

  void _decrementQuantity(String productId) {
    setState(() {
      final current = _selectedQuantities[productId] ?? 0;
      if (current > 0) {
        _selectedQuantities[productId] = current - 1;
      }
    });
  }

  Future<void> _confirmSelection() async {
    if (_isSubmitting) return;

    setState(() => _isSubmitting = true);

    _selectedProducts.clear();
    final batch = FirebaseFirestore.instance.batch();

    for (var producto in widget.listProductos) {
      final selectedQty = _selectedQuantities[producto.reference.id] ?? 0;

      if (selectedQty > 0) {
        final paquete = PaqueteStruct(
            nombreProducto: producto.nombreProducto,
            descripcion: producto.descripcion,
            cantidad: selectedQty,
            precio: producto.precio,
            imagen: producto.imagen,
            calorias: producto.calorias,
            refProducto: producto.reference);
        _selectedProducts.add(paquete);

        final nuevaCantidad = producto.cantidad - selectedQty;
        if (nuevaCantidad >= 0) {
          batch.update(producto.reference, {
            'Cantidad': nuevaCantidad,
          });
        }
      }
    }

    try {
      await batch.commit();

      if (_selectedProducts.isNotEmpty && widget.regresaLista != null) {
        await widget.regresaLista!(_selectedProducts);

        for (var key in _selectedQuantities.keys) {
          _selectedQuantities[key] = 0;
        }
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _selectedProducts.isNotEmpty
                ? '${_selectedProducts.length} productos agregados al kit'
                : 'Selecciona al menos un producto',
            style: TextStyle(color: _colors['card']),
          ),
          backgroundColor:
              _selectedProducts.isNotEmpty ? _colors['accent'] : Colors.orange,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error al actualizar productos: $e',
            style: TextStyle(color: _colors['card']),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Sin fecha';
    return DateFormat('MMM Ed', 'es').format(date);
  }

  int get _totalSelected {
    return _selectedQuantities.values
        .fold(0, (sum, quantity) => sum + quantity);
  }

  @override
  Widget build(BuildContext context) {
    final colors = _colors;

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: colors['background'],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colors['primary'],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.inventory_2, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Seleccionar Productos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Total: ${_formatoPrecio(_calcularTotal())}',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Badge(
                  backgroundColor: colors['accent'],
                  label: Text(
                    _totalSelected.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Icon(Icons.shopping_basket, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: widget.listProductos.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inventory_outlined,
                          size: 64,
                          color: colors['textSecondary'],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No hay productos disponibles',
                          style: TextStyle(
                            color: colors['textSecondary'],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: widget.listProductos.length,
                    itemBuilder: (context, index) {
                      final producto = widget.listProductos[index];
                      final selectedQty =
                          _selectedQuantities[producto.reference.id] ?? 0;
                      final availableQty = producto.cantidad;
                      final isAvailable = availableQty > 0;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: colors['card'],
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          border: Border.all(
                            color: selectedQty > 0
                                ? colors['primary']!
                                : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: colors['background'],
                                      image: producto.imagen != null &&
                                              producto.imagen!.isNotEmpty
                                          ? DecorationImage(
                                              image: NetworkImage(
                                                  producto.imagen!),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                    ),
                                    child: producto.imagen == null ||
                                            producto.imagen!.isEmpty
                                        ? Icon(
                                            Icons.image_not_supported_outlined,
                                            color: colors['textSecondary'],
                                          )
                                        : null,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          producto.nombreProducto,
                                          style: TextStyle(
                                            color: colors['text'],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_today,
                                              size: 16,
                                              color: colors['secondary'],
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Caducidad: ',
                                              style: TextStyle(
                                                color: colors['textSecondary'],
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              _formatDate(producto.caducidad),
                                              style: TextStyle(
                                                color: colors['textSecondary'],
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.inventory_2,
                                              size: 16,
                                              color: colors['secondary'],
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Disponibles: ',
                                              style: TextStyle(
                                                color: colors['textSecondary'],
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              '$availableQty',
                                              style: TextStyle(
                                                color: isAvailable
                                                    ? colors['textSecondary']
                                                    : Colors.red,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.local_fire_department,
                                              size: 16,
                                              color: colors['secondary'],
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Calorías: ',
                                              style: TextStyle(
                                                color: colors['textSecondary'],
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              '${producto.calorias} kcal',
                                              style: TextStyle(
                                                color: colors['textSecondary'],
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.attach_money,
                                              size: 16,
                                              color: colors['secondary'],
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Precio: ',
                                              style: TextStyle(
                                                color: colors['textSecondary'],
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              '${producto.precio}',
                                              style: TextStyle(
                                                color: colors['textSecondary'],
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Cantidad a agregar:',
                                    style: TextStyle(
                                      color: colors['text'],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  IconButton(
                                    icon: Icon(Icons.remove_circle,
                                        color: selectedQty > 0
                                            ? colors['primary']
                                            : Colors.grey),
                                    onPressed: selectedQty > 0
                                        ? () => _decrementQuantity(
                                            producto.reference.id)
                                        : null,
                                  ),
                                  Container(
                                    width: 40,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    decoration: BoxDecoration(
                                      color: selectedQty > 0
                                          ? colors['primary']!.withOpacity(0.1)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      selectedQty.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: colors['text'],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add_circle,
                                        color: isAvailable &&
                                                selectedQty < availableQty
                                            ? colors['primary']
                                            : Colors.grey),
                                    onPressed: isAvailable &&
                                            selectedQty < availableQty
                                        ? () => _incrementQuantity(
                                            producto.reference.id, availableQty)
                                        : null,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: colors['card'],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _confirmSelection,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors['primary'],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 3,
                ),
                child: _isSubmitting
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      )
                    : const Text(
                        'Agregar al Kit',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
