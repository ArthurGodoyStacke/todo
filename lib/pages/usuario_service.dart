import 'package:dio/dio.dart';

class UsuarioService {
  final Dio _dio = Dio();
  final String _baseUrl = "https://67d5cf37286fdac89bc0770f.mockapi.io/Arthur";

  Future<List<Map<String, dynamic>>> fetchUsuarios() async {
    try {
      final response = await _dio.get(_baseUrl);
      
      if (response.statusCode == 200) {
        final data = response.data as List;
        return data.map((usuario) {
          return {
            "nome": usuario["name"] ?? "Sem nome", 
            "id": usuario["id"].toString()
          };
        }).toList();
      } else {
        throw Exception("Erro ao carregar: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro na requisição: $e");
      throw Exception("Erro: $e");
    }
  }

  Future<void> adicionarUsuario(String nome) async {
    try {
      await _dio.post(_baseUrl, data: {"name": nome}); 
    } catch (e) {
      throw Exception("Erro ao adicionar: $e");
    }
  }

  Future<void> removerUsuario(String id) async {
    try {
      await _dio.delete("$_baseUrl/$id"); 
    } catch (e) {
      throw Exception("Erro ao remover: $e");
    }
  }
}