import 'package:demo/application/article/list/article_list_bloc.dart';
import 'package:demo/domain/article/model/article.dart';
import 'package:demo/presentation/pages/article/widgets/article_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleListBloc, ArticleListState>(
        builder: (context, state) {
          return state.maybeMap(
              loaded: (e) {
                List<Article> articles = e.articles;
                return ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Article article = articles[index];
                      return ArticleListItem(article);
                    }
                );
              },
              orElse: () => Container());
        }
    );
  }
}