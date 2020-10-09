class UtilsService {
  static extractMapValues(Map<String, dynamic> map, String key, defaultValue) {
    return map == null || map[key] == null ? defaultValue : map[key];
  }

  static String validateInput(String value) {
    if (value.length < 1) {
      return 'Please enter some value';
    }

    return null;
  }

  static String capitalize(final String input) {
    if (input == null) {
      throw new ArgumentError("string: $input");
    }

    if (input.length == 0) {
      return input;
    }
    final List<String> words = input.split('_');
    String output = '';
    words.forEach((word) {
      output += word[0].toUpperCase() + word.substring(1).toLowerCase() + ' ';
    });

    return output.trim();
  }
}
