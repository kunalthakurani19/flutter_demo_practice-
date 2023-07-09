// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_sizer/flutter_sizer.dart';

// import '../utils/app_colors.dart';
// import '../utils/app_styles.dart';
// import '../utils/utils.dart';

// // ignore: must_be_immutable
// class TextInputField extends StatelessWidget {
//   final dynamic prefixIcon;
//   final dynamic suffixIcon;

//   String? hintText, initialValue = '', errorText, label;
//   final TextInputType? keyboardType;
//   final TextInputAction? textInputAction;
//   final FocusNode? focusNode;
//   final Color? iconColor;
//   final bool obscureText, enabled;
//   final bool autoValidate, autofocus;
//   final double bottomMargin, contentPadding;
//   final double? hintTextSize;
//   final int? maxLines;
//   final double borderRadius;
//   final double? verticalPadding;
//   final int? maxLength;
//   dynamic validateFunction;
//   final Color borderColor, focusColor, labelColor, hintColor;
//   final Color? loaderColor;
//   dynamic onSaved;
//   final String? obscuringCharacter;
//   dynamic onFieldSubmitted;
//   final Color? filledColor;
//   dynamic controller;
//   final ValueChanged<String>? onChanged;
//   final VoidCallback? onClearPress;
//   List<TextInputFormatter>? inputFormatter;
//   final bool? isLoading, showSuffix;
//   final Color? cursorColor;
//   final String prefixText;
//   final double? height;
//   final TextCapitalization textCapitalization;

// //passing props in the Constructor.
// //Java like style
//   TextInputField({
//     Key? key,
//     this.hintText,
//     this.textCapitalization = TextCapitalization.none,
//     this.verticalPadding = 17,
//     this.label,
//     this.obscuringCharacter,
//     this.filledColor,
//     this.errorText,
//     this.borderColor = Colors.grey,
//     this.obscureText = false,
//     this.keyboardType,
//     this.initialValue,
//     this.maxLines,
//     this.prefixIcon,
//     this.hintTextSize,
//     this.iconColor,
//     this.bottomMargin = 1,
//     this.validateFunction,
//     this.onSaved,
//     this.enabled = true,
//     this.autoValidate = false,
//     this.borderRadius = 5,
//     this.contentPadding = 16,
//     this.textInputAction,
//     this.onFieldSubmitted,
//     this.focusNode,
//     this.controller,
//     this.maxLength,
//     this.inputFormatter,
//     this.suffixIcon,
//     this.autofocus = false,
//     this.isLoading = false,
//     this.onChanged,
//     this.onClearPress,
//     this.loaderColor,
//     this.showSuffix = false,
//     this.prefixText = "",
//     this.cursorColor = Colors.black,
//     this.focusColor = AppColors.grey,
//     this.labelColor = AppColors.grey,
//     this.hintColor = AppColors.grey,
//     this.height,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       margin: EdgeInsets.only(bottom: bottomMargin),
//       child: TextFormField(
//         cursorWidth: 0.5,
//         showCursor: true,
//         autofocus: autofocus,
//         controller: controller,
//         initialValue: initialValue,
//         style: AppStyles.normalTextSizeStyle.copyWith(
//           fontFamily: AppStyles.montserratRegular,
//           fontSize: AppUtils.isTablet() ? 16.dp : 15.dp,
//           color: AppColors.blackColor,
//         ),
//         key: key,
//         cursorColor: cursorColor,
//         enabled: enabled,
//         obscureText: obscureText,
//         keyboardType: keyboardType,
//         validator: validateFunction,
//         onSaved: onSaved,
//         focusNode: focusNode,
//         maxLength: maxLength,
//         autovalidateMode: autoValidate
//             ? AutovalidateMode.onUserInteraction
//             : AutovalidateMode.disabled,
//         textInputAction: textInputAction,
//         maxLines: maxLines,
//         onFieldSubmitted: onFieldSubmitted,
//         inputFormatters: inputFormatter,
//         onChanged: onChanged,
//         decoration: InputDecoration(
//           labelText: label,
//           labelStyle: TextStyle(
//             fontFamily: AppStyles.montserratRegular,
//             color: labelColor,
//             // fontWeight: FontWeight.w500,
//             fontSize: AppUtils.isTablet() ? 16.dp : 15.dp,
//           ),
//           prefixText: prefixText,
//           errorMaxLines: 3,
//           counterText: '',
//           fillColor: filledColor,
//           filled: true,
//           contentPadding: EdgeInsets.symmetric(
//               horizontal: contentPadding, vertical: verticalPadding ?? 0),
//           hintText: hintText,
//           errorText: errorText,
//           hintStyle: TextStyle(
//             fontFamily: AppStyles.montserratRegular,
//             color: hintColor,
//             fontSize: AppUtils.isTablet() ? 16.dp : 14.dp,
//           ),
//           errorStyle: TextStyle(
//             color: Theme.of(context).colorScheme.error,
//             fontFamily: AppStyles.montserratRegular,
//             fontSize: AppUtils.isTablet() ? 18 : 14,
//           ),
//           border: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: borderColor,
//                 width: 0.2.w,
//                 style: BorderStyle.solid,
//               ),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(borderRadius),
//               )),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: focusColor,
//               width: 0.2.w,
//               style: BorderStyle.solid,
//             ),
//             borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: borderColor,
//               width: 0.2.w,
//               style: BorderStyle.solid,
//             ),
//             borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
//           ),
//           disabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: borderColor,
//               width: 0.2.w,
//               style: BorderStyle.solid,
//             ),
//             borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: borderColor,
//               width: 0.2.w,
//               style: BorderStyle.solid,
//             ),
//             borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Theme.of(context).colorScheme.error,
//               width: 0.2.w,
//               style: BorderStyle.solid,
//             ),
//             borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
//           ),
//           prefixIcon: prefixIcon,
//           suffixIcon: suffixIcon,
//           suffix: (showSuffix ?? false)
//               ? (isLoading ?? false)
//                   ? SizedBox(
//                       width: 20,
//                       height: 20,
//                       child: Padding(
//                         padding: const EdgeInsets.all(15),
//                         child: CircularProgressIndicator(
//                             strokeWidth: 2,
//                             valueColor: AlwaysStoppedAnimation<Color>(
//                                 loaderColor ?? AppColors.whiteColor)),
//                       ),
//                     )
//                   : controller.text != ""
//                       ? IconButton(
//                           icon: const Icon(Icons.clear, size: 28),
//                           color: iconColor,
//                           onPressed: () {
//                             controller.clear();
//                             if (onClearPress != null) onClearPress!();
//                           },
//                         )
//                       : null
//               : null,
//         ),
//       ),
//     );
//   }
// }
