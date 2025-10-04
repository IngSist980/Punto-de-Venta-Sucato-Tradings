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

class AsignarRutas extends StatefulWidget {
  const AsignarRutas({
    super.key,
    this.width,
    this.height,
    required this.regresa,
  });

  final double? width;
  final double? height;
  final Future Function(List<RepartidorRutaStruct> rutas) regresa;

  @override
  State<AsignarRutas> createState() => _AsignarRutasState();
}

class _AsignarRutasState extends State<AsignarRutas> {
  final List<TextEditingController> _controllers =
      List.generate(7, (index) => TextEditingController());
  final List<String> _diasSemana = [
    'Lunes',
    'Martes',
    'Miércoles',
    'Jueves',
    'Viernes',
    'Sábado',
    'Domingo'
  ];

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  bool _todosLosCamposCompletos() {
    for (var controller in _controllers) {
      if (controller.text.trim().isEmpty) {
        return false;
      }
    }
    return true;
  }

  List<RepartidorRutaStruct> _obtenerRutas() {
    List<RepartidorRutaStruct> rutas = [];

    for (int i = 0; i < _diasSemana.length; i++) {
      rutas.add(RepartidorRutaStruct(
        dia: _diasSemana[i],
        localizacion: _controllers[i].text.trim(),
        ocupado: false,
        enviosDisponibles: 3,
      ));
    }

    return rutas;
  }

  void _enviarRutas() {
    if (_todosLosCamposCompletos()) {
      List<RepartidorRutaStruct> rutas = _obtenerRutas();
      widget.regresa(rutas);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Asignar Rutas por Día',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Todos los días deben tener una localización asignada',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _diasSemana.length,
              itemBuilder: (context, index) {
                bool isEmpty = _controllers[index].text.trim().isEmpty;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            _diasSemana[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (isEmpty) ...[
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'Requerido',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ]
                        ],
                      ),
                      const SizedBox(height: 4),
                      TextField(
                        controller: _controllers[index],
                        decoration: InputDecoration(
                          hintText:
                              'Ingresa la localización para ${_diasSemana[index]}',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8.0,
                          ),
                          errorText:
                              isEmpty ? 'Este campo es obligatorio' : null,
                          errorStyle: const TextStyle(fontSize: 12),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: _todosLosCamposCompletos() ? _enviarRutas : null,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text('Guardar Rutas'),
            ),
          ),
        ],
      ),
    );
  }
}
