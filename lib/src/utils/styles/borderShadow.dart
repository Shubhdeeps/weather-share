import 'package:flutter/material.dart';

BoxShadow BorderShadow() {
  return BoxShadow(
    color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
    spreadRadius: 5,
    blurRadius: 5,
    offset: Offset(2, 3),
  );
}
