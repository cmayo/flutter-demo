import 'package:auto_route/auto_route.dart';
import 'package:demo/application/article/detail/article_detail_bloc.dart';
import 'package:demo/domain/article/model/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArticleDetailWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticleDetailBloc, ArticleDetailState>(
      listener: listener,
      builder: builder
    );
  }

  void listener(BuildContext context, ArticleDetailState state) {
    state.maybeMap(
      error: (state) {
        AutoRouter.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.articleNotFound))
        );
      },
      orElse: () {}
    );
  }

  Widget builder(BuildContext context, ArticleDetailState state) {
    return state.maybeMap(
        loaded: (e) {
          Article article = e.article;
          return Column(
            children: [
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 150,
                        child: Ink.image(
                            image: NetworkImage(
                                article.image
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child:
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            article.title,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child:
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                              article.content
                          ),
                        )
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        },
        orElse: () => Container()
    );
  }
}