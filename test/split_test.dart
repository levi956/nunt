import 'package:nuntium_rigid/app/shared/shared.dart';
import 'package:test/test.dart';

void main() {
  test('Split function splits text into segments', () {
    const entireTexts =
        "This is the first sentence. This is the second sentence. This is the third sentence.";
    final result = split(entireTexts);

    expect(result.length, 2);

    const expectedFirstSegment =
        "The story starts here: This is the first sentence. This is the second sentence.";
    const expectedLastSegment =
        "Wrap the story up here: This is the third sentence.";

    expect(result[0], expectedFirstSegment);
    expect(result[1], expectedLastSegment);
  });

  test('Split function handles empty input', () {
    const entireTexts = "";
    final result = split(entireTexts);

    expect(result.length, 2);
    expect(result[0], "The story starts here: ");
    expect(result[1], "Wrap the story up here: ");
  });
}
