import 'package:flutter/material.dart';

class ListaUsuariosWidget extends StatelessWidget {
  final List<String> listaDeUsuarios;
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
        return ListTile(
          leading: const Icon(Icons.person),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => onRemoverUsuario(index),
          ),
          title: Text(listaDeUsuarios[index]),
        );
      },
    );
  }
}
