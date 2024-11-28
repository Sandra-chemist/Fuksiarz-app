class Utils {
  static String fixPolishCharacters(String input) {
    Map<String, String> polishChars = {
      'Ã³': 'ó',
      'Å': 'ł',
      'Å': 'Ń',
      'Åš': 'Ś',
      'Å¼': 'ż',
      'Ã': 'Ż',
      'Å': 'Ś',
      'Å›': 'ś',
      'Å¼': 'ż',
      'Å‚': 'ł',
      'Å¡': 'ś',
      'Å½': 'Ż',
    };

    polishChars.forEach((key, value) {
      input = input.replaceAll(key, value);
    });

    return input;
  }
}
