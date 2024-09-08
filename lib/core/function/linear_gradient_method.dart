import 'package:flutter/material.dart';

import '../../const.dart';

BoxDecoration linearGradientMethod() {
  return BoxDecoration(
    gradient: LinearGradient(
      end: Alignment.topLeft,
      begin: Alignment.bottomRight,
      colors: listColor,
    ),
  );
}
