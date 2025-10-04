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

class Caducidad extends StatefulWidget {
  const Caducidad({
    super.key,
    this.width,
    this.height,
    required this.fechaCaducidad,
  });

  final double? width;
  final double? height;
  final DateTime fechaCaducidad;

  @override
  State<Caducidad> createState() => _CaducidadState();
}

class _CaducidadState extends State<Caducidad> {
  int _diferenciaDias() {
    final now = DateTime.now();
    final diferencia = widget.fechaCaducidad.difference(now);
    return diferencia.inDays;
  }

  Color _obtenerColor() {
    final dias = _diferenciaDias();

    if (dias > 10) {
      return Colors.green.shade600;
    } else if (dias > 5) {
      return Colors.orange.shade700;
    } else {
      return Colors.red.shade600;
    }
  }

  IconData _obtenerIcono() {
    final dias = _diferenciaDias();

    if (dias > 10) {
      return Icons.check_circle_outline;
    } else if (dias > 5) {
      return Icons.warning_amber_outlined;
    } else {
      return Icons.error_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final dias = _diferenciaDias();
    final color = _obtenerColor();
    final icono = _obtenerIcono();

    return Container(
      width: widget.width ?? 150,
      height: widget.height ?? 50,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icono,
            color: color,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            dias >= 0 ? "Caduca en $dias días" : "Caducado",
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
