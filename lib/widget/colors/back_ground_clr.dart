import 'package:flutter/material.dart';

final bckClr = const Color.fromARGB(255, 37, 37, 37);
final homeGradient = LinearGradient(
  colors: [
    Color.fromARGB(255, 69, 75, 104),
    Color.fromARGB(255, 76, 83, 116),
    // Color.fromARGB(255, 99, 106, 151),
    Color.fromARGB(255, 34, 42, 51),
    const Color.fromARGB(255, 0, 0, 0),
    const Color.fromARGB(255, 0, 0, 0),
    const Color.fromARGB(255, 0, 0, 0),
    const Color.fromARGB(255, 0, 0, 0),
    const Color.fromARGB(255, 0, 0, 0)
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final appgradient = LinearGradient(
  colors: [
    Color.fromARGB(255, 69, 75, 104),
    Color.fromARGB(255, 80, 87, 122),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
