import 'package:flutter/material.dart';

class InputPwBox extends StatelessWidget {
  final String labelText;
  final bool isPasswordVisible;
  final void Function()? togglePasswordVisibility;
  final TextEditingController? controller;

  const InputPwBox({
    super.key,
    required this.labelText,
    required this.isPasswordVisible,
    this.togglePasswordVisibility,
    this.controller,
    required bool isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            "$labelText :",
            style: const TextStyle(
              fontSize: 13,
              color: Color.fromARGB(255, 97, 97, 97),
            ),
            textAlign: TextAlign.end,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            controller: controller,
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
              isDense: true,
              border: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 97, 97, 97),
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: togglePasswordVisibility,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
