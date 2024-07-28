import 'package:image_fetcher/utils/fetcher.dart';
import 'package:test/test.dart';

/// Test fetcher.
void main() {
  /// Test fetcher with valid url.
  test('Test fetcher with valid url', () async {
    final res = await Fetcher.getData('picsum.photos', 'id/2/info', true);
    expect(res.toString().length, greaterThan(0));
  });

  /// Test fetcher with invalid url.
  test('Test fetcher with invalid url', () async {
    final res =
        await Fetcher.getData('picsum.photos', 'id/2/info/wrong-api', false);
    expect(res, null);
  });
}
