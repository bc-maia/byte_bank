import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType type;

  const InputField(
      {Key key,
      this.label,
      this.hint,
      this.icon,
      this.type = TextInputType.text,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller ?? null,
        decoration: InputDecoration(
          // icon: Icon(icon) ?? null, !IMPORTANT!: this version doesn't fix the field length
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: type,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}
