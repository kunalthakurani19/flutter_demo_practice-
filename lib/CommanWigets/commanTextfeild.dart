import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class commantextinputfeild extends StatelessWidget {
  final dynamic prefixIcon;
  final dynamic suffixIcon;

  String? hintText, initialValue = '', errorText, label;

  final Color? iconColor;
  final bool obscureText;
  final bool? autoValidate, autofocus;
  final double? bottomMargin, contentPadding;
  final double? hintTextSize, fsize;
  final int? maxLines;
  final double? borderradius;
  final double? verticalPadding;
  final int? maxLength;
  dynamic validateFunction;
  final Color? borderColor, focusColor, labelColor, hintColor;
  final Color? loaderColor;
  dynamic onSaved;
  final String? obscuringCharacter;
  dynamic onFieldSubmitted;
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
  TextInputType? keyboardType;
  List? inputFormatters;
  bool? enabled;

  commantextinputfeild(
      {this.label,
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
      Future<void> Function()? onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        inputFormatters: [],
      ),
    );
  }
}
