import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app/core/constants/widgets/custom_text_field.dart';

class AuthHeader extends StatelessWidget {
  final String title;

  const AuthHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      color: const Color.fromARGB(255, 92, 157, 175),
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CustomAuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final Widget suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextAlign textAlign;
  final VoidCallback? onSuffixIconPressed;

  const CustomAuthTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.obscureText = false,
    this.textAlign = TextAlign.right,
    this.onSuffixIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: hintText,
      labelText: labelText,
      suffixIcon: onSuffixIconPressed != null
          ? IconButton(
              onPressed: onSuffixIconPressed,
              icon: suffixIcon,
            )
          : suffixIcon,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      textAlign: textAlign,
    );
  }
}

class AuthLogo extends StatelessWidget {
  const AuthLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        children: [
          Center(
            child: Image.asset('assets/images/logo.png'),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black, size: 25),
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }
}


class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const AuthButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 92, 157, 175),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
