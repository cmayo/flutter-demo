part of 'article_list_bloc.dart';

@freezed
abstract class ArticleListEvent with _$ArticleListEvent {
  const factory ArticleListEvent.getAll() = GetAll;
}