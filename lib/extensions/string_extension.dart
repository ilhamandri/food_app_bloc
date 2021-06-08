extension StringParsing on String {
  String capitalizeFirstLetter() {
    if (this == null) {
      return null;
    }
    if (this.length <= 1) {
      return this.toLowerCase();
    }

    // Split string if more than 1 words
    final List<String> words = this.split(' ');

    final capitalizeWord = words.map((word) {
      if (word.trim().isNotEmpty) {
        final String firstLetter = word.trim().substring(0, 1).toUpperCase();
        final String remainingLetter = word.trim().substring(1);
        return '$firstLetter$remainingLetter';
      }
      return '';
    });

    return capitalizeWord.join(' ');
  }
}
