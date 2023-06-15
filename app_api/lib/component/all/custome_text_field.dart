import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom(
      {super.key,
      required this.hint,
      required this.label,
      required this.icon,
      this.isPassword = false,
      this.controller,
      this.onChanged,
      this.obscureText = false,
      this.minLines = 1,
      this.maxLines = 1});

  final String hint;
  final String label;
  final IconData icon;
  final bool? isPassword;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool obscureText;
  final int minLines;
  final int maxLines;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        enabled: true,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscureText: widget.isPassword! && !clicked,
        cursorColor: const Color.fromARGB(255, 48, 95, 224),
        cursorWidth: 10,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: widget.hint,
            labelText: widget.label,
            prefixIcon: Icon(
              widget.icon,
              color: const Color.fromARGB(255, 52, 103, 206),
            ),
            suffixIcon: widget.isPassword!
                ? InkWell(
                    onTap: () {
                      clicked = !clicked;
                      setState(() {});
                    },
                    child: Icon(
                      clicked ? Icons.visibility : Icons.visibility_off,
                      color: clicked
                          ? const Color.fromARGB(255, 14, 66, 108)
                          : const Color.fromARGB(255, 143, 141, 141),
                    ),
                  )
                : null,
            labelStyle: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 13, 61, 110)))),
      ),
    );
  }
}
