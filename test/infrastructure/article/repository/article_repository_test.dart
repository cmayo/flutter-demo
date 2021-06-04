import 'dart:convert';

import 'package:dartz/dartz.dart';
import "package:demo/application/core/http/http_client_interface.dart";
import 'package:demo/domain/article/failure/article_failure.dart';
import 'package:demo/domain/article/model/article.dart';
import "package:demo/domain/article/repository/article_repository_interface.dart";
import "package:demo/domain/core/http/http_response.dart";
import "package:demo/infrastructure/article/repository/article_repository.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import "article_repository_test.mocks.dart";

@GenerateMocks([HttpClientInterface])
void main() {
  late MockHttpClientInterface mockHttpClient;
  late ArticleRepositoryInterface articleRepository;

  setUp(() {
    mockHttpClient = MockHttpClientInterface();
    articleRepository = ArticleRepository(mockHttpClient);
  });
  
  group("Article repository", () {

    test("returns server error on http error", () async {
      // When
      when(mockHttpClient.get(any)).thenAnswer((_) async => HttpResponse(
          "",
          500,
          new Map()
        )
      );
      final result = await articleRepository.getAll();

      // Then
      expect(result.isLeft(), true);
      expect(result, Left(ArticleFailure.serverError()));
    });

    test("returns all articles", () async {
      // Given
      String responseData = '[{"id":1,"title":"Xxxx","body":"Content xxxx"},{"id":2,"title":"Yyyy","body":"Content yyyy"}]';

      // When
      when(mockHttpClient.get(any)).thenAnswer((_) => Future.value(HttpResponse(
            responseData,
            200,
            new Map()
        )
      ));
      final result = await articleRepository.getAll();

      // Then
      expect(result.isRight(), true);
      List<Article> articles = [];
      result.fold((l) => null, (r) => articles = r);
      expect(articles.length, 2);
    });

    test("returns article not found on get by id", () async {
      // Given
      int articleId = 1;
      
      // When
      when(mockHttpClient.get(any)).thenAnswer((_) async => HttpResponse(
          "",
          404,
          new Map()
      )
      );
      final result = await articleRepository.getById(articleId);

      // Then
      expect(result.isLeft(), true);
      expect(result, Left(ArticleFailure.notFound()));
    });

    test("returns article by id successfully", () async {
      // Given
      int articleId = 1;
      Article expectedArticle = Article(id: 1, title: "Xxxx", content: "xxxx", image: "image1");

      // When
      when(mockHttpClient.get(any)).thenAnswer((_) async => HttpResponse(
          jsonEncode(expectedArticle.toJson()),
          200,
          new Map()
      )
      );
      final result = await articleRepository.getById(articleId);

      // Then
      expect(result.isRight(), true);
      expect(result, Right(expectedArticle));
    });

  });

}