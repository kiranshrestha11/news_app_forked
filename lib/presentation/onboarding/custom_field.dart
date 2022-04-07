import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.prefixIconData,
    this.obscure = false,
    this.textInputAction = TextInputAction.next,
    this.suffixIconData,
    required this.validationFunction,
    required this.formkey,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIconData;
  final IconData? suffixIconData;
  final bool obscure;
  final TextInputAction textInputAction;
  final String? Function(String?)? validationFunction;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          border: Border.all(
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          )),
      child: TextFormField(
        validator: validationFunction,
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: Icon(prefixIconData),
          suffixIcon: suffixIconData == null ? null : Icon(suffixIconData),
        ),
      ),
    );
  }
}
