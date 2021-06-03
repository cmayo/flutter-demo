part of 'article_detail_bloc.dart';

@freezed
abstract class ArticleDetailEvent with _$ArticleDetailEvent {
  const factory ArticleDetailEvent.getById(int id) = GetById;
}