import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:demo/application/core/http/http_client_interface.dart';
import 'package:demo/domain/article/failure/article_failure.dart';
import 'package:demo/domain/article/model/article.dart';
import 'package:demo/domain/article/repository/article_repository_interface.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ArticleRepositoryInterface)
class ArticleRepository implements ArticleRepositoryInterface {
  final HttpClientInterface httpClient;

  ArticleRepository(this.httpClient);

  @override
  Future<Either<ArticleFailure, List<Article>>> getAll() async {
    try {
      final response = await this.httpClient.get('https://jsonplaceholder.typicode.com/posts');
      Iterable data = json.decode(response.body);
      List<Article> articles = List<Article>.from(data.map((data) {
        if (!data.containsKey('image')) {
          data['image'] = 'https://picsum.photos/id/${data['id']}/200/300';
        }
        var article = Article.fromJson(data);
        return article;
      }));
      return Right(articles);
    } catch (Exception) {
      return Left(ArticleFailure.serverError());
    }
  }

  @override
  Future<Either<ArticleFailure, Article>> getById(int id) async {
    try {
      final response = await this.httpClient.get('https://jsonplaceholder.typicode.com/posts/$id');

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        if (!data.containsKey('image')) {
          data['image'] = 'https://picsum.photos/id/${data['id']}/200/300';
        }
        var article = Article.fromJson(data);
        return Right(article);
      } else {
        return Left(ArticleFailure.notFound());
      }
    } catch (Exception) {
      return Left(ArticleFailure.serverError());
    }
  }
}