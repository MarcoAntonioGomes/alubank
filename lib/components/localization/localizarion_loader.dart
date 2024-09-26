import 'package:alubank/components/localization/localization_service.dart';
import 'package:alubank/components/services/api_service.dart';
import 'package:alubank/screens/home.dart';
import 'package:flutter/material.dart';


class LocalizationLoader extends StatefulWidget {
  final String locale;

  const LocalizationLoader({Key? key, required this.locale}) : super(key: key);

  @override
  _LocalizationLoaderState createState() => _LocalizationLoaderState();
}

class _LocalizationLoaderState extends State<LocalizationLoader> {
  late Future<Map<String, dynamic>> _localizationFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    // Iniciamos o carregamento lazy ao chamar o fetchLocalizationFile ao iniciar o widget
    _localizationFuture = _apiService.fetchLocalizationFile(widget.locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carregando Localização'),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _localizationFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Exibe a tela de loading enquanto espera o retorno da API
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Caso haja um erro na requisição
              return Text('Erro: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final localizationData = snapshot.data!;
              i18n().loadLocalizedStrings(localizationData);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              });
              return const CircularProgressIndicator();
            } else {
              return const Text('Nenhum dado disponível');
            }
          },
        ),
      ),
    );
  }

  // Função que constrói a interface usando os dados carregados
  Widget _buildLocalizationContent(Map<String, dynamic> localizationData) {
    return ListView.builder(
      itemCount: localizationData.length,
      itemBuilder: (context, index) {
        final key = localizationData.keys.elementAt(index);
        final value = localizationData[key];
        return ListTile(
          title: Text(key),
          subtitle: Text(value.toString()),
        );
      },
    );
  }
}
