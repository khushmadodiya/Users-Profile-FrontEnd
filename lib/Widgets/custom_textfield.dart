import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextField extends StatelessWidget {

  final TextEditingController controller;

  final IconData? suffix;
  final List<TextInputFormatter>? inputFormatter;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final String? hintText;


  const CustomTextField({
    super.key,
    required this.controller,
    this.suffix,
    this.onSubmitted,
    this.onChanged,
    this.onTap,
    this.validator,
    this.hintText,
    this.inputFormatter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: SizedBox(
        height: 30,
        child: TextFormField(
          controller: controller,

          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),

          onTap: onTap,
          onFieldSubmitted: onSubmitted,
          onChanged: onChanged,

          validator: validator,

          cursorHeight: 16,
          cursorColor: Colors.grey,

          inputFormatters: inputFormatter,

          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10, top: 1, bottom: 1, right: 1),

            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),

            errorStyle: const TextStyle(
              fontSize: 0,
            ),

            suffixIcon: Icon(
              suffix,
              color: Colors.grey.shade400,
            ),

            focusColor: Colors.grey.shade300,
            // isDense: true,

            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            ),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
