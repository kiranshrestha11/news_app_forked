import 'package:news_app/data/models/post_model.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  List<PostModel> posts;
  PostLoaded({required this.posts});
}

class PostError extends PostState {
  String error;
  PostError({required this.error});
}
