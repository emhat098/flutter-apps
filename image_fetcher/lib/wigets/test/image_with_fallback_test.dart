// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:image_fetcher/wigets/image_with_fallback.dart';

void main() {
  testWidgets('Test wiget image with fallback with valid url image',
      (WidgetTester tester) async {
    const uriImage = 'https://picsum.photos/1080';
    const altImage = 'Test author';
    await tester.pumpWidget(
        const ImageWithFallback(imageUri: uriImage, imageAlt: altImage));
    final alt = find.textContaining('Click');
    expect(alt, isNotNull);
  });
}
