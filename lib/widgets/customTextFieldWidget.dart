import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  String hint;
  TextInputType keyboard;
  Icon suffix;
  int length;
  TextEditingController controller;


  CustomTextFieldWidget({
    super.key,
    required this.hint,
    required this.suffix,
    required this.controller,
    this.keyboard = TextInputType.text,
    this.length = 15,

  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      maxLength: widget.length,
      keyboardType: widget.keyboard,
      onChanged: (value) => setState(() => widget.controller.text),
      decoration: InputDecoration(
        errorText: nameTextError(),
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hint,
        hintStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        suffixIcon: widget.suffix,
        suffixIconColor: Colors.blueAccent,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }


  String? nameTextError() {
    String text = widget.controller.value.text;
    if (text.isEmpty) {
      return 'Field Required';
    } else {
      return null;
    }

  }
}
