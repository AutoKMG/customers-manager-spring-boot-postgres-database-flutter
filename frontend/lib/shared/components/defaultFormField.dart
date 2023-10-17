import 'package:flutter/material.dart';

Widget defaultFormField(
    {required context,
    required TextEditingController controller,
    required String label}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
  );
}
