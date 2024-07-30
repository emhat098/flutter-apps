import 'package:flutter/material.dart';
import 'package:todo/models/post.dart';

/// TodoItem wiget.
class TodoItem extends StatelessWidget {
  final Post post;
  final VoidCallback onTap;

  // Constructor to accept the Post object
  const TodoItem({super.key, required this.post, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.black,
          )),
      subtitle: Text(post.body,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 11,
            color: Colors.black87,
          )),
      onTap: onTap,
    );
  }
}
