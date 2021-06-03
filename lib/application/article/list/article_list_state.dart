part of 'article_list_bloc.dart';

@freezed
abstract class ArticleListState with _$ArticleListState {
  const factory ArticleListState.initial() = Initial;
  const factory ArticleListState.loaded(List<Article> articles) = Loaded;
}