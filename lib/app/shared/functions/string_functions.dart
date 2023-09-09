List<String> split(String entireTexts) {
  final sentences = entireTexts.split(RegExp(r'(?<=[.!?])\s+'));
  final splitValue = (sentences.length / 2).ceil();

  List<String> segments = [];
  for (int i = 0; i < sentences.length; i += splitValue) {
    int end =
        (i + splitValue < sentences.length) ? i + splitValue : sentences.length;
    var segment = sentences.sublist(i, end).join(' ').trim();
    segments.add(segment);
  }
  segments[0] = "The story starts here: ${segments[0]}";
  segments[segments.length - 1] =
      "Wrap the story up here: ${segments[segments.length - 1]}";
  return segments.take(2).toList();
}

bool isValidEmailAddress(String it) =>
    RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(it);

bool isValidPassword(String it) => it.length >= 6;

String formatAmount(double it, [int itAsFixed = 2]) =>
    it.toStringAsFixed(itAsFixed).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
String zeroPrefixNumber(int number) => number < 10 ? "0$number" : "$number";

String numberSuffixWord(int number, String word) {
  if (word.endsWith('y')) {
    return "$number ${number > 1 ? "${word.substring(0, word.length - 1)}ies" : word}";
  }
  return "$number ${number > 1 ? "${word}s" : word}";
}

String capitalize(String it) => it.isEmpty
    ? it
    : it[0].toUpperCase() + it.substring(1, it.length).toLowerCase();
