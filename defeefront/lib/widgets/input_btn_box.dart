import 'package:flutter/material.dart';

class InputBtnBox extends StatelessWidget {
  final String labelText;
  final String buttonText;
  final void Function()? onButtonPressed;
  final TextEditingController? controller;

  const InputBtnBox({
    super.key,
    required this.labelText,
    required this.buttonText,
    this.onButtonPressed,
    this.controller,
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
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              isDense: true,
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 97, 97, 97),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: onButtonPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(70, 40),
            backgroundColor: const Color.fromARGB(255, 0, 122, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
      ],
    );
  }
}
