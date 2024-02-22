import 'package:app_mobile/consts/consts.dart';
import 'package:flutter/material.dart';

Widget dgWidget({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imgBackground),
        fit: BoxFit.cover, // You can adjust the BoxFit as needed
      ),
    ),
    child: child,
  );
}
