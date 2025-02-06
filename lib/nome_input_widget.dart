import 'package:flutter/material.dart';

class NomeInputWidget extends StatelessWidget {
  final TextEditingController controller;

  const NomeInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Digite um nome',
        border: OutlineInputBorder(),
      ),
    );
  }
}
