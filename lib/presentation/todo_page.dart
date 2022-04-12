import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/models/todo_model.dart';
import 'package:news_app/logic/todo_notifier.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final _todo = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        actions: [
          IconButton(
              onPressed: () {
                // showModalBottomSheet(
                //     context: context,
                //     builder: (context) => Column(
                //           children: const [
                //             TextField(
                //               decoration:
                //                   InputDecoration(hintText: 'Enter title'),
                //             ),
                //             TextField(
                //               decoration: InputDecoration(
                //                   hintText: 'Enter Description'),
                //             ),
                //           ],
                //         ));
                showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    insetPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                    title: const Text('Add New Todo'),
                    children: [
                      TextField(
                        controller: titleController,
                        decoration:
                            const InputDecoration(hintText: 'Enter title'),
                      ),
                      TextField(
                        controller: descriptionController,
                        decoration: const InputDecoration(
                            hintText: 'Enter Description'),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            TodoModel todo = TodoModel(
                              title: titleController.text,
                              description: descriptionController.text,
                              id: 8,
                            );

                            if (ref
                                .watch(todoProvider.notifier)
                                .idList()
                                .contains(todo.id)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Id already taken')));
                            } else {
                              ref.read(todoProvider.notifier).addTodo(todo);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Add'))
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView(
        children: _todo
            .map((e) => ListTile(
                  title: Text(e.title),
                  subtitle: Text(e.description),
                  trailing: Text(e.id.toString()),
                ))
            .toList(),
      ),
    );
  }
}
