import 'package:flutter/material.dart';

class Commantextinputfeild extends StatelessWidget {
  final dynamic prefixIcon;
  final dynamic suffixIcon;

  final String? hintText, initialValue = '', errorText, label;

  final Color? iconColor;
  final bool obscureText;
  final bool? autoValidate, autofocus;
  final double? bottomMargin, contentPadding;
  final double? hintTextSize, fsize;
  final int? maxLines;
  final double? borderradius;
  final double? verticalPadding;
  final int? maxLength;
  final dynamic validateFunction;
  final Color? borderColor, focusColor, labelColor, hintColor;
  final Color? loaderColor;
  final dynamic onSaved;
  final String? obscuringCharacter;
  final dynamic onFieldSubmitted;
  final Color? filledColor;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClearPress;
  final bool? isLoading, showSuffix;
  final Color? cursorColor;
  final String? prefixText;
  final double? height;
  final TextCapitalization? textCapitalization;
  final BoxConstraints? box;
  final TextInputType? keyboardType;
  final List? inputFormatters;
  final bool? enabled;

  const Commantextinputfeild(
      {super.key,
      this.label,
      this.errorText,
      this.prefixIcon,
      this.suffixIcon,
      this.iconColor,
      this.obscureText = false,
      this.autoValidate,
      this.autofocus,
      this.bottomMargin,
      this.contentPadding,
      this.hintTextSize,
      this.maxLines,
      this.borderradius = 20,
      this.verticalPadding,
      this.maxLength,
      this.borderColor,
      this.focusColor,
      this.labelColor,
      this.hintColor,
      this.loaderColor,
      this.obscuringCharacter,
      this.filledColor,
      this.onChanged,
      this.onClearPress,
      this.isLoading,
      this.showSuffix,
      this.cursorColor,
      this.prefixText,
      this.height,
      this.textCapitalization,
      this.fsize,
      this.hintText,
      this.controller,
      this.box,
      this.validateFunction,
      this.keyboardType,
      this.inputFormatters,
      this.enabled,
      Future<void> Function()? onTap,
      this.onSaved,
      this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        validator: validateFunction,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderradius!)),
          labelText: label,
          labelStyle: TextStyle(
            fontSize: fsize,
          ),
          prefixText: prefixText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          prefixIconConstraints: box,
        ),
        keyboardType: keyboardType,
        inputFormatters: const [],
      ),
    );
  }
}
