import 'package:flutter/material.dart';

class MyTextfields extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextfields(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  State<MyTextfields> createState() => _MyTextfieldsState();
}

class _MyTextfieldsState extends State<MyTextfields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            fillColor: const Color.fromARGB(255, 194, 190, 177),
            filled: true,
            hintText: widget.hintText,
          ),
        ));
  }
}
