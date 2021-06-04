import 'package:demo/domain/article/model/article.dart';
import 'package:demo/domain/article/repository/article_repository_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'article_list_event.dart';
part 'article_list_state.dart';
part 'article_list_bloc.freezed.dart';

@injectable
class ArticleListBloc extends Bloc<ArticleListEvent, ArticleListState> {
  ArticleRepositoryInterface articleRepository;

  ArticleListBloc(this.articleRepository): super(ArticleListState.initial());

  @override
  Stream<ArticleListState> mapEventToState(ArticleListEvent event) async* {
    yield* event.map(
        getAll: getAll
    );
  }

  Stream<ArticleListState> getAll(GetAll event) async* {
    final successOrFailure = await articleRepository.getAll();

    yield successOrFailure.fold(
      (error) => ArticleListState.error(),
      (result) => ArticleListState.loaded(result)
    );
  }
}