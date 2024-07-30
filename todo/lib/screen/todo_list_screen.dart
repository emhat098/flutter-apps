import 'package:flutter/material.dart';
import 'package:todo/models/post.dart';
import 'package:todo/screen/todo_screen.dart';
import 'package:todo/services/api_service.dart';
import 'package:todo/wigets/todo_item.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = ApiService().fetchPosts();
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: FutureBuilder(
        future: futurePosts,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No posts found'));
          } else {
            List<Post> posts = snapshot.data!;
            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (ctx, index) {
                  return TodoItem(
                      post: posts[index],
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) =>
                                  TodoScreen(todoId: posts[index].id))));
                });
          }
        },
      ),
    );
  }
}
