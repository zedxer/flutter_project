import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/viewmodels/student_view_models.dart';

class ListScreenWithProviders extends StatelessWidget {
  const ListScreenWithProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StudentViewModel>(
      create: (_) => StudentViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Post List'),
        ),
        body: Consumer<StudentViewModel>(
          builder: (context, viewModel, _) {
            if (viewModel.posts2.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: viewModel.posts2.length,
                itemBuilder: (context, index) {
                  final post = viewModel.posts2[index];
                  return ListTile(
                    title: Text(post.title ==null?post.title!:'title'),
                    subtitle: Text(post.body ==null?post.body!:'body'),
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<StudentViewModel>(context, listen: false).fetchPosts();
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}





