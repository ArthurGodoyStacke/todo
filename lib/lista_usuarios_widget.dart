import 'package:flutter/material.dart';

class ListaUsuariosWidget extends StatelessWidget {
  final List<Map<String, dynamic>> listaDeUsuarios;
  final Function(int) onRemoverUsuario;

  const ListaUsuariosWidget({
    super.key,
    required this.listaDeUsuarios,
    required this.onRemoverUsuario,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaDeUsuarios.length,
      itemBuilder: (context, index) {
        final usuario = listaDeUsuarios[index];
        return ListTile(
          title: Text(
            usuario["nome"] ?? "Nome não encontrado", 
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => onRemoverUsuario(index),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          visualDensity: const VisualDensity(vertical: 2),
        );
      },
    );
  }
}