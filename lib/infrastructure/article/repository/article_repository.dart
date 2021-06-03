import 'dart:convert';

import 'package:demo/domain/article/model/article.dart';
import 'package:demo/domain/article/repository/article_repository_interface.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;


@Injectable(as: ArticleRepositoryInterface)
class ArticleRepository implements ArticleRepositoryInterface {
  @override
  Future<List<Article>> getAll() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    Iterable data = json.decode(response.body);
    List<Article> articles = List<Article>.from(data.map((data) {
      data['image'] = 'https://picsum.photos/id/${data['id']}/200/300';
      var article = Article.fromJson(data);
      return article;
    }));
    return articles;
  }

  @override
  Future<Article> getById(int id) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));
    Map<String, dynamic> data = json.decode(response.body);
    data['image'] = 'https://picsum.photos/id/${data['id']}/200/300';
    var article = Article.fromJson(data);
    return article;
  }
}