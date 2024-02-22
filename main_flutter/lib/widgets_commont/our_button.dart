import 'package:flutter/material.dart';

Widget ourButton({onPress, color, textColor, title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: () {
      if (onPress != null) {
        onPress(); // Invoke the callback
      }
    },
    child: Text(
      title,
      style: TextStyle(color: textColor),
    ),
  );
}
