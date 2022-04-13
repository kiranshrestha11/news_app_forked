class PostModel {
  final String title;
  final String body;

  const PostModel({required this.title, required this.body});

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      PostModel(title: json['title'], body: json['body']);

  Map<String, dynamic> toJson() => {
        title: title,
        body: body,
      };
}
