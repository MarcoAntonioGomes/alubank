import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    // Configurações iniciais do Dio, como tempo limite, cabeçalhos etc.
    _dio.options.baseUrl = 'https://idiomas.free.beeceptor.com';
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  Future<Map<String, dynamic>> fetchLocalizationFile(String locale) async {
    try {
      // Supondo que o arquivo de idioma seja retornado no endpoint `/localization/{locale}`
      final response = await _dio.get('/localization/$locale');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Erro ao carregar o arquivo de idioma');
      }
    } catch (e) {
      throw Exception('Erro ao fazer a requisição: $e');
    }
  }
}
