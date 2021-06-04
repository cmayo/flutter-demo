import 'package:dartz/dartz.dart';
import 'package:demo/domain/article/failure/article_failure.dart';
import 'package:demo/domain/article/model/article.dart';

abstract class ArticleRepositoryInterface {
  Future<Either<ArticleFailure, List<Article>>> getAll();
  Future<Either<ArticleFailure, Article>> getById(int id);
}