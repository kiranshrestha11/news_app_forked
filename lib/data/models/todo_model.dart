class TodoModel {
  final int id;
  final String title;
  final String description;

  const TodoModel({
    required this.description,
    required this.title,
    required this.id,
  });
}

List<TodoModel> todoList = const [
  TodoModel(id: 1, title: 'First Todo', description: 'First Descritpion'),
  TodoModel(id: 2, title: 'Second Todo', description: 'Second Descritpion'),
  TodoModel(id: 3, title: 'Add appbar Todo', description: 'appbar Descritpion'),
  TodoModel(id: 4, title: 'Buy Bread Todo', description: 'First Descritpion'),
  TodoModel(id: 5, title: 'Hello Todo', description: 'Hello Descritpion'),
  TodoModel(id: 6, title: 'First Todo', description: 'First Descritpion'),
];
