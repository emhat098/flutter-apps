import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_fetcher/utils/app_constants.dart';

/// Fetcher class for support get the data from external service.
///
/// Example:
///
/// ```dart
/// final res = await Fetcher.getData('picsum.photos', 'id/2/info', true);
/// ```
class Fetcher {
  /// getData function to get the data from Uri.https(domain, params);
  static Future<dynamic> getData(
      String domain, String params, bool isHttps) async {
    try {
      Uri uri = isHttps ? Uri.https(domain, params) : Uri.http(domain, params);
      final res = await http.get(uri);
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }
      return null;
    } catch (e) {
      if (isDevelopment) {
        throw Exception(e.toString());
      }
    }
  }
}
