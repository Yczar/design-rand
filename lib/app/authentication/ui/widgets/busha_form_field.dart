import 'package:flutter/material.dart';

class BushaFormField extends StatefulWidget {
  const BushaFormField({
    required this.title,
    required this.controller,
    this.hintText = '',
    this.suffixWidget,
    this.validator,
    this.obscureText = false,
    super.key,
  });
  final TextEditingController controller;
  final String title;
  final bool obscureText;
  final String hintText;
  final Widget? suffixWidget;
  final FormFieldValidator<dynamic>? validator;

  @override
  State<BushaFormField> createState() => _BushaFormFieldState();
}

class _BushaFormFieldState extends State<BushaFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          validator: widget.validator,
          decoration: InputDecoration(
            suffixIcon: widget.suffixWidget,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.32),
              fontSize: 16,
            ),
            filled: true,
            fillColor: const Color(0xFFEFEFEF),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
