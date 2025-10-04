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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> updateProductos(
  List<ProductosOrdenesClientesStruct> productosAComprar,
  Future Function(bool resultado) regresaResultado,
) async {
  try {
    int productosActualizados = 0;
    int productosConError = 0;

    for (var productoCompra in productosAComprar) {
      try {
        final refProducto = productoCompra.refProducto;
        if (refProducto == null) {
          productosConError++;
          continue;
        }

        final productoDoc = await refProducto.get();

        if (!productoDoc.exists) {
          productosConError++;
          continue;
        }

        final datosProducto = productoDoc.data() as Map<String, dynamic>?;
        if (datosProducto == null) {
          productosConError++;
          continue;
        }

        final cantidadActual = datosProducto['Cantidad'] as int? ?? 0;
        final cantidadAComprar = productoCompra.cantidad;

        // Obtener la cantidad actual vendida
        final cantidadVendidaActual =
            datosProducto['CantidadVendidas'] as int? ?? 0;

        if (cantidadActual < cantidadAComprar) {
          productosConError++;
          continue;
        }

        final nuevaCantidad = cantidadActual - cantidadAComprar;
        final nuevaCantidadVendida = cantidadVendidaActual + cantidadAComprar;

        await FirebaseFirestore.instance.runTransaction((transaction) async {
          final productoSnapshot = await transaction.get(refProducto);
          // ... misma lógica pero dentro de la transacción
          transaction.update(refProducto, {
            'Cantidad': nuevaCantidad,
            'CantidadVendidas': nuevaCantidadVendida,
            'ComentarioAjuste': 'Venta realizada -${cantidadAComprar} unidades',
          });
        });

        productosActualizados++;
      } catch (e) {
        print('Error actualizando producto: $e');
        productosConError++;
      }
    }

    bool exito = productosConError == 0;

    await regresaResultado(exito);

    return exito;
  } catch (e) {
    print('Error general en updateProductos: $e');
    await regresaResultado(false);
    return false;
  }
}
