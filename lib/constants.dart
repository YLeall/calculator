import 'package:flutter/material.dart';

final MaterialStateProperty<Icon?> thumbIcon =
    MaterialStateProperty.resolveWith<Icon?>(
  (Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return const Icon(
        Icons.dark_mode_outlined,
        color: Colors.white,
      );
    }
    return const Icon(
      Icons.wb_sunny_rounded,
      color: Colors.black,
    );
  },
);

final MaterialStateProperty<Color?> trackOutlineColor =
    MaterialStateProperty.resolveWith<Color?>(
  (Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return Colors.transparent;
    }
    return Colors.transparent;
  },
);
