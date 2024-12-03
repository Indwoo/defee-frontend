import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;

  const InputBox({
    super.key,
    required this.labelText,
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
        SizedBox(
          width: 50,
        )
      ],
    );
  }
}
