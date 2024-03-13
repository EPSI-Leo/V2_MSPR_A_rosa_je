import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatelessWidget {
  AppTextFormField({
    super.key,
    this.onChanged,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.radius = 8.0,
    this.tint = Colors.black,
    this.height,
    this.label,
    this.color = Colors.white,
    this.filled,
    this.borderColor,
    this.hint,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines,
  });

  final String? label;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  var obscureText = false;
  final double radius;
  final Color tint;
  final double? height;
  final Color color;
  final String? hint;
  final bool? filled;
  final Color? borderColor;
  final int? maxLength;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    if (maxLines == null) {
      return TextFormField(
        obscureText: obscureText,
        controller: controller,
        onChanged: onChanged,
        cursorColor: tint,
        style: TextStyle(height: height),
        decoration: InputDecoration(
          counterText: '',
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          hintStyle: TextStyle(color: tint),
          focusColor: Colors.transparent,
          labelText: label,
          labelStyle: TextStyle(color: tint),
          filled: filled,
          fillColor: color,
          hintText: hint,
        ),
        validator: validator,
        maxLength: maxLength,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
      );
    } else {
      return TextFormField(
        maxLines: maxLines,
        controller: controller,
        onChanged: onChanged,
        cursorColor: tint,
        style: TextStyle(height: height),
        decoration: InputDecoration(
          counterText: '',
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          hintStyle: TextStyle(color: tint),
          focusColor: Colors.transparent,
          labelText: label,
          labelStyle: TextStyle(color: tint),
          filled: filled,
          fillColor: color,
          hintText: hint,
        ),
        validator: validator,
        maxLength: maxLength,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
      );
    }
  }
}
