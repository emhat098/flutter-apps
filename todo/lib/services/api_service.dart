import 'dart:convert';

import 'package:todo/models/post.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String url = 'https://jsonplaceholder.typicode.com/posts/';

  /// Get list of todo post.
  Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Post> posts =
            body.map((dynamic item) => Post.fromJson(item)).toList();
        return posts;
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Failed to load posts: $e');
    }
  }

  /// Get todo by post id.
  Future<Post> fetchPost(int id) async {
    try {
      final response = await http.get(Uri.parse(url + id.toString()));
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        Post post = Post.fromJson(body);
        return post;
      } else {
        throw Exception('Failed to load post: $id');
      }
    } catch (e) {
      throw Exception('Failed to load post: $e');
    }
  }
}
