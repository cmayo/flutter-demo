import 'package:demo/domain/article/model/article.dart';

abstract class ArticleRepositoryInterface {
  Future<List<Article>> getAll();
  Future<Article> getById(int id);
}