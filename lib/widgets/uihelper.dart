import 'package:flutter/material.dart';

class UiHelper {
  static CustomTextField(
      TextEditingController controller, String text, IconData icondata) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: text,
            suffixIcon: Icon(icondata),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(7))),
      ),
    );
  }
}
