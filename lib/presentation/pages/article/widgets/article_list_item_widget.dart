import 'package:demo/domain/article/model/article.dart';
import 'package:demo/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class ArticleListItemWidget extends StatelessWidget {
  final Article article;

  ArticleListItemWidget(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Card(
              child: InkWell(
                onTap: () {
                  context.router.push(ArticleDetailRoute(articleId: article.id));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Ink.image(
                              image: NetworkImage(
                                  article.image
                              ),
                              fit: BoxFit.cover
                            )
                          ),
                        ],
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
                  ],
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }

}