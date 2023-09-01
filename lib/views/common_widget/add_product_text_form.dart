import 'package:flutter/material.dart';

class AddProductTextForm extends StatefulWidget {
  final String hint;
  final String label;
  final int? maxLine;
  final TextEditingController controller;
  const AddProductTextForm(
      {super.key,
      required this.hint,
      required this.label,
      this.maxLine,
      required this.controller});

  @override
  State<AddProductTextForm> createState() => _AddProductTextFormState();
}

class _AddProductTextFormState extends State<AddProductTextForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: widget.controller,
        maxLines: widget.maxLine,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: widget.hint,
          label: Text(widget.label),
        ),
      ),
    );
  }
}
