part of 'article_detail_bloc.dart';

@freezed
class ArticleDetailState with _$ArticleDetailState {
  const factory ArticleDetailState.initial() = Initial;
  const factory ArticleDetailState.error() = Error;
  const factory ArticleDetailState.loaded(Article article) = Loaded;
}