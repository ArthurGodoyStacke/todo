import 'package:flutter/material.dart';
import 'package:todo/lista_usuarios_widget.dart';
import 'package:todo/nome_input_widget.dart';
import 'usuario_service.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UsuarioService _usuarioService = UsuarioService();
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _listaDeUsuarios = [];

  @override
  void initState() {
    super.initState();
    _carregarUsuarios();
  }

  Future<void> _carregarUsuarios() async {
    try {
      final usuarios = await _usuarioService.fetchUsuarios();
      setState(() {
        _listaDeUsuarios = usuarios;
      });
    } catch (e) {
      _mostrarErro("Erro ao carregar usuários: $e");
    }
  }

  Future<void> _adicionarUsuario() async {
    if (_controller.text.isEmpty) return;

    try {
      await _usuarioService.adicionarUsuario(_controller.text);
      await _carregarUsuarios();
      _controller.clear();
    } catch (e) {
      _mostrarErro("Erro ao adicionar usuário: $e");
    }
  }

 Future<void> _removerUsuario(int index) async {
  try {
    final usuarioId = _listaDeUsuarios[index]["id"].toString();
    await _usuarioService.removerUsuario(usuarioId);
    
  
    await _carregarUsuarios();
    
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Erro ao excluir: ${e.toString()}")),
    );
  }
}

  void _mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          NomeInputWidget(controller: _controller),
          Expanded(
            child: ListaUsuariosWidget(
              listaDeUsuarios: _listaDeUsuarios,
              onRemoverUsuario: _removerUsuario,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarUsuario,
        child: const Icon(Icons.add),
      ),
    );
  }
}