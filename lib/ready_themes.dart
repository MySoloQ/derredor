import 'package:flutter/material.dart';

final Map<String, Color> ihnmaimsColors = {
  'despairGray': const Color(0xFF2E2E2E),
  'machineBlue': const Color(0xFF1A237E),
  'memorySilver': const Color(0xFFB0BEC5),
  'rustRed': const Color(0xFF8B0000),
  'survivorYellow': const Color(0xFFFFC107),
  'voidBlack': const Color(0xFF000000),
};

InputDecoration loginFormField(String? label, String? hint) {
  return InputDecoration(
    hintText: hint,
    labelText: label,
    hintStyle: TextStyle(color: ihnmaimsColors['survivorYellow']),
    labelStyle: TextStyle(color: ihnmaimsColors['survivorYellow']),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide:
          BorderSide(color: ihnmaimsColors['survivorYellow']!, width: 3),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide:
          BorderSide(color: ihnmaimsColors['survivorYellow']!, width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: ihnmaimsColors['rustRed']!, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: ihnmaimsColors['rustRed']!, width: 2),
    ),
  );
}

ListView listViewBuilderWrapper(
    BuildContext context, Axis direction, Widget columnOrRow) {
  return ListView.builder(
    scrollDirection: direction,
    itemBuilder: (context, index) => columnOrRow,
  );
}
