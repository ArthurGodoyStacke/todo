import 'package:flutter/material.dart';

class NomeInputWidget extends StatelessWidget {
  final TextEditingController controller;

  const NomeInputWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          labelText: 'Digite um nome',
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.person),
        ),
      ),
    );
  }
}