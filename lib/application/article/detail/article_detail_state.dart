part of 'article_detail_bloc.dart';

@freezed
abstract class ArticleDetailState with _$ArticleDetailState {
  const factory ArticleDetailState.initial() = Initial;
  const factory ArticleDetailState.loaded(Article article) = Loaded;
}