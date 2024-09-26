
class LocaleResolver {
  static final LocaleResolver _instance = LocaleResolver._internal();

  factory LocaleResolver() {
    return _instance;
  }

  LocaleResolver._internal();

  final Map<String, String> _locales = {
  'en': 'en-us',
  'pt': 'pt-br',
  };

 String resolve(String lang){
    return _locales[lang] ?? lang;
  }



}