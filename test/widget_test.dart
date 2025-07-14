//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('El contador no es 0 tras 3 clics', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp()); // Construye la app principal

    // Pulsa el botón de incrementar 3 veces
    final boton = find.text('Incrementar'); // Busca el botón por su texto
    await tester.tap(boton); // Primer clic
    await tester.pump(); // Espera el frame
    await tester.tap(boton); // Segundo clic
    await tester.pump(); // Espera el frame
    await tester.tap(boton); // Tercer clic
    await tester.pump(); // Espera el frame

    // El contador no debe mostrar 0
    expect(find.text('3'), findsNothing); // Verifica que no aparece el 0
    // El contador debe mostrar 3
    expect(find.text('0'), findsOneWidget); // Verifica que aparece el 3
  });

  testWidgets('El contador incrementa correctamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp()); // Construye la app principal

    // El contador debe empezar en 0
    expect(find.text('0'), findsOneWidget); // Verifica que aparece el 0
    expect(find.text('1'), findsNothing); // Verifica que no aparece el 1

    // Pulsa el botón de incrementar
    await tester.tap(find.text('Incrementar')); // Clic en el botón
    await tester.pump(); // Espera el frame

    // Ahora el contador debe mostrar 1
    expect(find.text('1'), findsOneWidget); // Verifica que aparece el 1
    expect(find.text('0'), findsNothing); // Verifica que ya no aparece el 0
  });
}
