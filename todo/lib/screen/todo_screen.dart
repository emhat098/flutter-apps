import 'package:flutter/material.dart';
import 'package:todo/models/post.dart';
import 'package:todo/services/api_service.dart';

class TodoScreen extends StatefulWidget {
  final int todoId;

  const TodoScreen({super.key, required this.todoId});

  @override
  // ignore: library_private_types_in_public_api
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late Future<Post> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = ApiService().fetchPost(widget.todoId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Detail'),
      ),
      body: FutureBuilder<Post>(
        future: futurePost,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No post found'));
          } else {
            Post post = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.title,
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 16),
                  Text(post.body, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
