import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextStyle? labelStyle;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final List<String>? autofilltext;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final InputDecoration? customDecoration;
  final Color? fillColor;
  final bool? filled;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? errorText;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? minLines;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;

  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.labelStyle,
    this.obscureText = false,
    this.keyboardType,
    this.autofilltext,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.customDecoration,
    this.fillColor,
    this.filled = true,
    this.floatingLabelBehavior,
    this.errorText,
    this.focusNode,
    this.maxLines = 1,
    this.minLines,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.textAlign = TextAlign.left,
  });

  InputDecoration _buildDefaultDecoration(BuildContext context) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey,
          ),
      labelText: labelText,
      labelStyle: labelStyle ?? Theme.of(context).textTheme.bodyMedium,
      // floatingLabelBehavior: FloatingLabelBehavior.always,
      alignLabelWithHint: true,

      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: filled,
      fillColor: fillColor ?? const Color(0xFFf7f7f7),
      floatingLabelBehavior: floatingLabelBehavior ?? FloatingLabelBehavior.auto,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color.fromARGB(255, 92, 157, 175), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      errorText: errorText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      autofillHints: autofilltext,
      keyboardType: keyboardType,
      focusNode: focusNode,
      maxLines: maxLines,
      minLines: minLines,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      decoration: customDecoration ?? _buildDefaultDecoration(context),
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      textAlign: textAlign, // التحكم في محاذاة النص
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_app/utils/classes';

// class CustomTextField extends StatelessWidget {
//   final TextEditingController? controller;
//   final String? hintKey;
//   final String? labelKey;
//   final String? errorKey;
//   final TextStyle? labelStyle;
//   final bool? obscureText;
//   final TextInputType? keyboardType;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final FormFieldValidator<String>? validator;
//   final ValueChanged<String>? onChanged;
//   final ValueChanged<String>? onSubmitted;
//   final InputDecoration? customDecoration;
//   final Color? fillColor;
//   final bool? filled;
//   final FloatingLabelBehavior? floatingLabelBehavior;
//   final FocusNode? focusNode;
//   final int? maxLines;
//   final int? minLines;
//   final TextCapitalization textCapitalization;
//   final TextInputAction? textInputAction;

//   const CustomTextField({
//     super.key,
//     this.controller,
//     this.hintKey,
//     this.labelKey,
//     this.errorKey,
//     this.labelStyle,
//     this.obscureText = false,
//     this.keyboardType,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.validator,
//     this.onChanged,
//     this.onSubmitted,
//     this.customDecoration,
//     this.fillColor,
//     this.filled = true,
//     this.floatingLabelBehavior,
//     this.focusNode,
//     this.maxLines = 1,
//     this.minLines,
//     this.textCapitalization = TextCapitalization.none,
//     this.textInputAction,
//   });

//   InputDecoration _buildDefaultDecoration(BuildContext context) {
//     final localizations = AppLocalizations.of(context);

//     return InputDecoration(
//       hintText: localizations?.translate(hintKey ?? "hint_text"),
//       hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
//             color: Colors.grey,
//           ),
//       labelText: localizations?.translate(labelKey ?? "label_text"),
//       labelStyle: labelStyle ?? Theme.of(context).textTheme.bodyMedium,
//       prefixIcon: prefixIcon,
//       suffixIcon: suffixIcon,
//       filled: filled,
//       fillColor: fillColor ?? const Color(0xFFf7f7f7),
//       floatingLabelBehavior:
//           floatingLabelBehavior ?? FloatingLabelBehavior.auto,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: Colors.grey),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: Colors.grey),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: Colors.blue, width: 1.5),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: Colors.red),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: Colors.red, width: 1.5),
//       ),
//       errorText: localizations?.translate(errorKey ?? "error_text"),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText ?? false,
//       keyboardType: keyboardType,
//       focusNode: focusNode,
//       maxLines: maxLines,
//       minLines: minLines,
//       textCapitalization: textCapitalization,
//       textInputAction: textInputAction,
//       decoration: customDecoration ?? _buildDefaultDecoration(context),
//       validator: validator,
//       onChanged: onChanged,
//       onFieldSubmitted: onSubmitted,
//     );
//   }
// }
