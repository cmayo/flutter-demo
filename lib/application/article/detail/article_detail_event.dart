part of 'article_detail_bloc.dart';

@freezed
class ArticleDetailEvent with _$ArticleDetailEvent {
  const factory ArticleDetailEvent.getById(int id) = GetById;
}