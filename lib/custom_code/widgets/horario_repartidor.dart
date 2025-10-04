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

class HorarioRepartidor extends StatefulWidget {
  const HorarioRepartidor({
    super.key,
    this.width,
    this.height,
    required this.horario,
    required this.regresaLista,
    required this.regresaDia,
  });

  final double? width;
  final double? height;
  final List<RepartidorRutaStruct> horario;
  final Future Function(List<RepartidorRutaStruct> listaActualizada)
      regresaLista;
  final Future Function(String? diaSeleccionado) regresaDia;

  @override
  State<HorarioRepartidor> createState() => _HorarioRepartidorState();
}

class _HorarioRepartidorState extends State<HorarioRepartidor> {
  late List<RepartidorRutaStruct> _listaHorarios;
  String? _diaSeleccionado;

  @override
  void initState() {
    super.initState();
    _listaHorarios = List.from(widget.horario);

    final diaSeleccionadoExistente = _listaHorarios
        .where((ruta) => ruta.enviosDisponibles > 0)
        .map((ruta) => ruta.dia)
        .firstOrNull;

    if (diaSeleccionadoExistente != null) {
      _diaSeleccionado = diaSeleccionadoExistente;
    }
  }

  void _seleccionarDia(String dia) {
    setState(() {
      if (_diaSeleccionado == dia) {
        _diaSeleccionado = null;
        _resetearEnvios(dia);
      } else {
        final diaAnterior = _diaSeleccionado;
        if (diaAnterior != null) {
          _resetearEnvios(diaAnterior);
        }

        _diaSeleccionado = dia;
        _descontarEnvio(dia);
      }
    });

    widget.regresaLista(_listaHorarios);
    widget.regresaDia(_diaSeleccionado);
  }

  void _descontarEnvio(String dia) {
    final index = _listaHorarios.indexWhere((ruta) => ruta.dia == dia);
    if (index != -1) {
      _listaHorarios[index] = _listaHorarios[index].copyWith(
        enviosDisponibles: 2,
        ocupado: false,
      );
    }
  }

  void _resetearEnvios(String dia) {
    final index = _listaHorarios.indexWhere((ruta) => ruta.dia == dia);
    if (index != -1) {
      _listaHorarios[index] = _listaHorarios[index].copyWith(
        enviosDisponibles: 3,
        ocupado: false,
      );
    }
  }

  Widget _buildDiaItem(RepartidorRutaStruct ruta) {
    final bool estaSeleccionado = _diaSeleccionado == ruta.dia;
    final bool estaOcupado = ruta.ocupado;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: estaSeleccionado ? Colors.blue.shade400 : Colors.grey.shade200,
          width: estaSeleccionado ? 2 : 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _seleccionarDia(ruta.dia),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                _obtenerIconoDia(ruta.dia),
                                color: estaSeleccionado
                                    ? Colors.blue.shade600
                                    : Colors.grey.shade600,
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                ruta.dia,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: estaSeleccionado
                                      ? Colors.blue.shade800
                                      : Colors.grey.shade800,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          if (ruta.localizacion != null &&
                              ruta.localizacion!.isNotEmpty)
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: estaSeleccionado
                                      ? Colors.blue.shade500
                                      : Colors.grey.shade500,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    ruta.localizacion!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: estaSeleccionado
                                          ? Colors.blue.shade700
                                          : Colors.grey.shade700,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    if (estaSeleccionado)
                      Icon(
                        Icons.check_circle,
                        color: Colors.green.shade600,
                        size: 20,
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.local_shipping,
                          color: Colors.orange.shade600,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Envíos disponibles:',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: _obtenerColorContador(ruta.enviosDisponibles),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${ruta.enviosDisponibles}/3',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ruta.enviosDisponibles > 0
                              ? Colors.white
                              : Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
                if (estaOcupado)
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red.shade200),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.red.shade600,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Límite alcanzado',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _obtenerIconoDia(String dia) {
    final diaLower = dia.toLowerCase();
    if (diaLower.contains('lun')) return Icons.calendar_today;
    if (diaLower.contains('mar')) return Icons.date_range;
    if (diaLower.contains('mié') || diaLower.contains('mie'))
      return Icons.event;
    if (diaLower.contains('jue')) return Icons.calendar_month;
    if (diaLower.contains('vie')) return Icons.weekend;
    if (diaLower.contains('sáb') || diaLower.contains('sab'))
      return Icons.beach_access;
    if (diaLower.contains('dom')) return Icons.free_breakfast;
    return Icons.calendar_today;
  }

  Color _obtenerColorContador(int envios) {
    if (envios == 0) return Colors.grey.shade200;
    if (envios == 1) return Colors.orange.shade400;
    if (envios == 2) return Colors.orange.shade600;
    return Colors.red.shade600;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Horario de Repartidor',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Selecciona un día (se descontará 1 envío automáticamente)',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        const SizedBox(height: 16),
        if (_listaHorarios.isEmpty)
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 48,
                  color: Theme.of(context).disabledColor,
                ),
                const SizedBox(height: 12),
                Text(
                  'No hay horarios disponibles',
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ],
            ),
          )
        else
          Expanded(
            child: ListView.builder(
              itemCount: _listaHorarios.length,
              itemBuilder: (context, index) {
                return _buildDiaItem(_listaHorarios[index]);
              },
            ),
          ),
      ]),
    );
  }
}

extension RepartidorRutaExtension on RepartidorRutaStruct {
  RepartidorRutaStruct copyWith({
    String? dia,
    String? localizacion,
    bool? ocupado,
    int? enviosDisponibles,
  }) {
    return RepartidorRutaStruct(
      dia: dia ?? this.dia,
      localizacion: localizacion ?? this.localizacion,
      ocupado: ocupado ?? this.ocupado,
      enviosDisponibles: enviosDisponibles ?? this.enviosDisponibles,
    );
  }
}

extension FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull {
    try {
      return first;
    } catch (e) {
      return null;
    }
  }
}
