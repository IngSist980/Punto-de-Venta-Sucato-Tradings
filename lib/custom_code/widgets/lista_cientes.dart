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

import 'package:animations/animations.dart';

class ListaCientes extends StatefulWidget {
  const ListaCientes({
    super.key,
    this.width,
    this.height,
    required this.listCliente,
    required this.regresaDatos,
  });

  final double? width;
  final double? height;
  final List<ClientesFrecuentesRecord> listCliente;
  final Future Function(
          DocumentReference regresaRefCliente, String regresaNombreCliente)
      regresaDatos;

  @override
  State<ListaCientes> createState() => _ListaCientesState();
}

class _ListaCientesState extends State<ListaCientes> {
  final TextEditingController _searchController = TextEditingController();
  List<ClientesFrecuentesRecord> _filteredClientes = [];
  List<ClientesFrecuentesRecord> _sortedClientes = [];
  ClientesFrecuentesRecord? _selectedCliente;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _filterAndSortClientes();
      setState(() {
        _isInitialized = true;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _filterAndSortClientes();
  }

  void _filterAndSortClientes() {
    final query = _searchController.text.toLowerCase().trim();

    setState(() {
      _filteredClientes = widget.listCliente.where((cliente) {
        final matchesEstado = true;
        final matchesSearch = query.isEmpty ||
            (cliente.cedulaJuridica?.toLowerCase().contains(query) ?? false) ||
            (cliente.nombreCompleto?.toLowerCase().contains(query) ?? false);

        return matchesEstado && matchesSearch;
      }).toList();

      _sortedClientes = List.from(_filteredClientes)
        ..sort((a, b) {
          final ordersA = a.cantidaOrdenes ?? 0;
          final ordersB = b.cantidaOrdenes ?? 0;
          return ordersB.compareTo(ordersA);
        });
    });
  }

  void _selectCliente(ClientesFrecuentesRecord cliente) {
    setState(() {
      _selectedCliente = cliente;
    });
  }

  Future<void> _confirmSelection() async {
    if (_selectedCliente != null) {
      await widget.regresaDatos(
        _selectedCliente!.reference,
        _selectedCliente!.nombreCompleto,
      );
      if (mounted) {
        Navigator.of(context).pop();
      }
    } else {
      _showNoSelectionSnackBar();
    }
  }

  void _showNoSelectionSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.amber[100]),
            const SizedBox(width: 8),
            const Text('Por favor seleccione un cliente'),
          ],
        ),
        backgroundColor: Colors.orange[800],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _closeDialog() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: widget.width ?? size.width * 0.9,
      height: widget.height ?? size.height * 0.8,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(isDarkMode),
          const SizedBox(height: 20),
          _buildSearchBar(isDarkMode),
          const SizedBox(height: 16),
          _buildListTitle(isDarkMode),
          const SizedBox(height: 12),
          Expanded(
            child: _isInitialized
                ? _buildClientsList(isDarkMode)
                : _buildLoadingState(isDarkMode),
          ),
          const SizedBox(height: 20),
          _buildActionButtons(isDarkMode),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Seleccionar Cliente',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        IconButton(
          onPressed: _closeDialog,
          icon: Icon(Icons.close_rounded, size: 28, color: Colors.white),
          style: IconButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar(bool isDarkMode) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black54 : Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Buscar por cédula o nombre...',
          prefixIcon: Icon(Icons.search_rounded,
              color: isDarkMode ? Colors.grey[400] : Colors.grey[600]),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear_rounded,
                      color: isDarkMode ? Colors.grey[400] : Colors.grey[600]),
                  onPressed: () {
                    _searchController.clear();
                    _filterAndSortClientes();
                  },
                )
              : null,
          hintStyle: TextStyle(
            color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
          ),
        ),
        style: TextStyle(
          fontSize: 16,
          color: isDarkMode ? Colors.white : Colors.black87,
        ),
      ),
    );
  }

  Widget _buildListTitle(bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.list_alt_rounded,
                size: 18,
                color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
              ),
              const SizedBox(width: 8),
              Text(
                'Clientes Disponibles (${_sortedClientes.length})',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.sort_rounded,
                  size: 12,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 4),
                Text(
                  'Ordenado por compras',
                  style: TextStyle(
                    fontSize: 10,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClientsList(bool isDarkMode) {
    if (_sortedClientes.isEmpty) {
      return _buildEmptyState(isDarkMode);
    }

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black54 : Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ListView.separated(
          itemCount: _sortedClientes.length,
          separatorBuilder: (context, index) => Divider(
              height: 1,
              color: isDarkMode ? Colors.grey[700] : Colors.grey[100]),
          itemBuilder: (context, index) {
            final cliente = _sortedClientes[index];
            return _buildClientItem(cliente, isDarkMode, index);
          },
        ),
      ),
    );
  }

  Widget _buildClientItem(
      ClientesFrecuentesRecord cliente, bool isDarkMode, int index) {
    final isSelected = _selectedCliente?.reference == cliente.reference;
    final isActive = cliente.estado == true;
    final ordersCount = cliente.cantidaOrdenes ?? 0;

    return Material(
      color: isSelected
          ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
          : (isDarkMode ? Colors.grey[800] : Colors.white),
      child: InkWell(
        onTap: () => _selectCliente(cliente),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : (isDarkMode ? Colors.grey[500]! : Colors.grey[400]!),
                    width: 2,
                  ),
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                ),
                child: isSelected
                    ? Icon(Icons.check_rounded, size: 16, color: Colors.white)
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            cliente.nombreCompleto ?? 'Sin nombre',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isActive
                                  ? (isDarkMode
                                      ? Colors.white
                                      : Colors.grey[800])
                                  : (isDarkMode
                                      ? Colors.grey[500]
                                      : Colors.grey[400]),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (!isActive) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? Colors.grey[700]
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'INACTIVO',
                              style: TextStyle(
                                fontSize: 10,
                                color: isDarkMode
                                    ? Colors.grey[400]
                                    : Colors.grey[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.badge_rounded,
                            size: 14,
                            color: isDarkMode
                                ? Colors.grey[400]
                                : Colors.grey[500]),
                        const SizedBox(width: 4),
                        Text(
                          cliente.cedulaJuridica ?? 'Sin cédula',
                          style: TextStyle(
                            fontSize: 12,
                            color: isActive
                                ? (isDarkMode
                                    ? Colors.grey[300]
                                    : Colors.grey[600])
                                : (isDarkMode
                                    ? Colors.grey[500]
                                    : Colors.grey[400]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (index < 3) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: _getRankColor(index, isDarkMode),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _getRankText(index),
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isActive
                          ? Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.2)
                          : (isDarkMode ? Colors.grey[700] : Colors.grey[200]),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.shopping_cart_rounded,
                            size: 14,
                            color: isActive
                                ? Theme.of(context).colorScheme.primary
                                : (isDarkMode
                                    ? Colors.grey[400]
                                    : Colors.grey[500])),
                        const SizedBox(width: 4),
                        Text(
                          '$ordersCount',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: isActive
                                ? Theme.of(context).colorScheme.primary
                                : (isDarkMode
                                    ? Colors.grey[400]
                                    : Colors.grey[500]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getRankColor(int index, bool isDarkMode) {
    switch (index) {
      case 0:
        return const Color(0xFFFFD700);
      case 1:
        return const Color(0xFFC0C0C0);
      case 2:
        return const Color(0xFFCD7F32);
      default:
        return isDarkMode ? const Color(0xFF424242) : const Color(0xFFE0E0E0);
    }
  }

  String _getRankText(int index) {
    switch (index) {
      case 0:
        return '🥇 1°';
      case 1:
        return '🥈 2°';
      case 2:
        return '🥉 3°';
      default:
        return '${index + 1}°';
    }
  }

  Widget _buildLoadingState(bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Cargando clientes...',
            style: TextStyle(
              color: isDarkMode ? Colors.grey[300] : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.people_alt_rounded,
            size: 80,
            color: isDarkMode ? Colors.grey[600] : Colors.grey[300],
          ),
          const SizedBox(height: 16),
          Text(
            'No hay clientes disponibles',
            style: TextStyle(
              fontSize: 18,
              color: isDarkMode ? Colors.grey[400] : Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(bool isDarkMode) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: _closeDialog,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              elevation: 2,
              shadowColor: Colors.red.withOpacity(0.3),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.close_rounded, size: 20),
                SizedBox(width: 8),
                Text(
                  'Cerrar',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: _confirmSelection,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              elevation: 2,
              shadowColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.3),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_rounded, size: 20),
                SizedBox(width: 8),
                Text(
                  'Seleccionar',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
