import 'package:demo/domain/article/exception/article_not_found_exception.dart';
import 'package:demo/domain/article/model/article.dart';
import 'package:demo/domain/article/repository/article_repository_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'article_detail_event.dart';
part 'article_detail_state.dart';
part 'article_detail_bloc.freezed.dart';

@injectable
class ArticleDetailBloc extends Bloc<ArticleDetailEvent, ArticleDetailState> {
  ArticleRepositoryInterface articleRepository;

  ArticleDetailBloc(this.articleRepository): super(ArticleDetailState.initial());

  @override
  Stream<ArticleDetailState> mapEventToState(ArticleDetailEvent event) async* {
    yield* event.map(
        getById: getById
    );
  }

  Stream<ArticleDetailState> getById(GetById event) async* {
    try {
      Article article = await articleRepository.getById(event.id);
      yield ArticleDetailState.loaded(article);
    } catch(e) {
      yield ArticleDetailState.error();
    }
  }
}