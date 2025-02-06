import 'package:flutter/material.dart';
import 'package:todo/lista_usuarios_widget.dart';
import 'package:todo/nome_input_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nomeInputController = TextEditingController();
  final List<String> listaDeUsuarios = ["Arthur", "Fernando", "Tulio Gomes"];

  void adicionarUsuario() {
    if (nomeInputController.text.isNotEmpty) {
      setState(() {
        listaDeUsuarios.add(nomeInputController.text);
        nomeInputController.clear();
      });
    }
  }

  void removerUsuario(int index) {
    setState(() {
      listaDeUsuarios.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          NomeInputWidget(controller: nomeInputController),
          const SizedBox(height: 20),
          Expanded(
            child: ListaUsuariosWidget(
              listaDeUsuarios: listaDeUsuarios,
              onRemoverUsuario: removerUsuario,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: adicionarUsuario,
        child: const Icon(Icons.add),
      ),
    );
  }
}
