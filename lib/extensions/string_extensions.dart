// lib/extensions/string_extensions.dart

extension StringExtensions on String {
  String toTitleCase() {
    if (isEmpty) return this;
    
    // Split into words
    final words = split(' ');
    
    // Capitalize first letter of each word
    final capitalizedWords = words.map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    });
    
    // Join words back together
    return capitalizedWords.join(' ');
  }
}